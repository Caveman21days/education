class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @params = params
    User.create(f_name: params[:f_name])
  end
end
