class DcommentsController < ApplicationController
  before_action :set_dcomment, only: [:show, :update, :destroy]

  # GET /dcomments
  def index
    @dcomments = Dcomment.all

    render json: @dcomments
  end

  # GET /dcomments/1
  def show

    page_number = params[:page].try(:[], :number)
    per_page = params[:page].try(:[], :size)

    @dcomments = Dcomment.where('discovery_id' => params[:id]).page(page_number).per(per_page)

    # cache
    expires_in 30.seconds, public: true

    if stale?(etag: @dcomments)
      render json: @dcomments, adapter: :json, meta: pagination_dict(@dcomments)
    end
  end

  # POST /dcomments
  def create
    @dcomment = Dcomment.new(dcomment_params)

    if @dcomment.save
      render json: @dcomment, status: :created, location: @dcomment
    else
      render json: @dcomment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dcomments/1
  def update
    if @dcomment.update(dcomment_params)
      render json: @dcomment
    else
      render json: @dcomment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dcomments/1
  def destroy
    @dcomment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dcomment
      @dcomment = Dcomment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dcomment_params
      params.require(:dcomment).permit(:content, :user_id, :discovery_id)
    end
end
