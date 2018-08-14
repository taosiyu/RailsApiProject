class AuthenticationController < ApplicationController
  def create
    # 登陆成功返回token
    if user = User.find_by(name: params[:name]).try(:authenticate, params[:password])
      render json: user, adapter: :json_api ,status: :ok, meta: user.token
    else
      render json: { msg: { errors: ['用户名或密码错误'] } }, status: :unauthorized
    end
  end

  #  发送验证信息
  def edit

  end



  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
