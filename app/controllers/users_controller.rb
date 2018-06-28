class UsersController < ApplicationController
  authorize_resource

<<<<<<< HEAD
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

=======
>>>>>>> c13ea4d0bf9df0463ee5f82d01255b642fb86b51
end
