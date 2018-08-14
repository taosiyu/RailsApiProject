class ApplicationController < ActionController::API
  attr_accessor :current_user
  # before_action :authenticate!
  before_action :ensure_json_request

  # header 中没有 Accept = application/tsy.api+json 就返回nil
  def ensure_json_request
    puts request.headers
    unless request.headers["Accept"] =~ /tsy\.api\+json/
      render body: nil, :status => 406
    else
      unless request.get?
        return
      end
    end
  end

  protected

  # 验证token,并且获取当前的用户信息
  def authenticate!
    render_failed and return unless token?
    @current_user = User.find_by(id: auth_token[:user_id])
  rescue JWT::VerificationError, JWT::DecodeError
    render_failed
  end

  private

  # 失败以后给予提示信息
  def render_failed(messages = ['验证失败'])
    render json: { errors: messages}, status: :unauthorized
  end

  # 从header中获取对应的token
  def http_token
    @http_token ||= if request.headers['Authorization'].present?
                      request.headers['Authorization'].split(' ').last
                    end
  end

  # 解析token
  def auth_token
    @auth_token ||= Token.decode(http_token)
  end

  # token是否存在
  def token?
    http_token && auth_token && auth_token[:user_id].to_i
  end


  # json模式下的分页
  def pagination_dict(collection)
    {
        current_page: collection.current_page,
        next_page: collection.next_page,
        prev_page: collection.prev_page, # use collection.previous_page when using will_paginate
        total_pages: collection.total_pages,
        total_count: collection.total_count
    }
  end

end
