class UsersController < ApplicationController
  authorize_resource
<<<<<<< HEAD
  before_action :set_user, only: [:show, :edit, :update]

  def index
    respond_with @users = User.all
  end

=======
  before_action :set_user, only: [:show]


  def index
    @users = User.all
  end

  def show; end

>>>>>>> 7571333c601dd3016c2ee69a0538d7ed91824a96
  def new
    @user = User.new
  end

<<<<<<< HEAD
  def show; end

  def edit; end

  def update
    respond_with @user
    @user.update_attributes(user_params)
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
=======
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:f_name, :l_name, :email)
>>>>>>> 7571333c601dd3016c2ee69a0538d7ed91824a96
  end

  def set_user
    @user = User.find(params[:id])
  end
end
