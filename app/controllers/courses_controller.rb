class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id]) 
  end

  def new
    @course = Courses.new
  end

  def create; end

  def edit; end

  def update; end

  def destroy; end
end
