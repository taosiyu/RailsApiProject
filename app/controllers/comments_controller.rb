class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments, include: [:user], adapter: :json
  end

  # GET /comments/1
  def show
    page_number = params[:page].try(:[], :number)
    per_page = params[:page].try(:[], :size)

    @comments = Comment.where('card_id' => params[:id]).page(page_number).per(per_page)

    # cache
    expires_in 30.seconds, public: true

    if stale?(etag: @comments)
      render json: @comments, adapter: :json, meta: pagination_dict(@comments)
    end
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :card_id)
    end
end
