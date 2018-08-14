class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :user_params2, only: [:create]

  # GET /users
  def index
    @users = User.all

    render json: @users, root: "data", adapter: :json
  end

  # GET /users/1
  def show
    render json: @user, adapter: :json
  end

  # POST /users
  def create

    @user = User.new(user_params2)

    if @user.save
      #发送邮件
      # UserMailer.account_activation(@user).deliver_now
      render json: @user, status: :created, location: @user, meta: @user.token
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :gender, :phone, :email, :image, :password,
                                   :password_confirmation)
    end

    def user_params2
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
