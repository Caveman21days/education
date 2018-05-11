class CoursesController < ApplicationController

  #Можно писать так
  def index
    @courses = Course.all
  end

  def show
    @courses = Course.find(params[:id])
  end

  #Можно и так, если ничего внутри нет
  def new; end
  
  def create; end
  
  def edit; end
  
  def update; end
  
  def destroy; end
end