class UsersController < ApplicationController
  authorize_resource
  before_action :set_user, only: [:show, :edit, :update]

  def index
    respond_with @users = User.all
  end

  def show; end

  def edit; end

  def update
    @user.update(user_params)
    respond_with @user
  end

  private

  def user_params
    params.require(:user).permit(:f_name, :s_name, :l_name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
