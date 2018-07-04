class UsersController < ApplicationController
  authorize_resource
  before_action :set_user, only: [:show, :edit, :update]


  def index
    @users = User.all
  end

  def show; end

  def new
    respond_with @user = User.new
  end

  def create
    respond_with(@user = User.create(user_params))
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:f_name, :l_name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
