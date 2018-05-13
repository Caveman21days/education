class CoursesController < ApplicationController

  #Можно писать так
  def index
    @courses = Course.all
  end

  def show
    # мы разве не хотим показать один курс или за что вообще отвечает @courses
    @course = Course.find(params[:id])
  end

  #Можно и так, если ничего внутри нет
  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end
end
