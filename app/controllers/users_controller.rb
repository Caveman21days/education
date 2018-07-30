class UsersController < ApplicationController
  authorize_resource
  before_action :set_user, only: [:show, :edit, :update]

  def index
    respond_with @users = User.all
  end

  def new
    @user = User.new
  end

  def show; end

  def edit; end

  def update
    respond_with @user
    @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:f_name, :s_name, :l_name,
      :email, :city, :stage, :birth_date,
      :region, :street, :house, :apartment,
      :school, :school_graduation_date,
      :university, :university_graduation_date,
      :vk_profile, :telegram_profile,
      :second_language)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
