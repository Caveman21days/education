class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_field, only: [:new, :create, :index]

  authorize_resource


  def index
    respond_with @courses = @field.courses
  end

  def show; end

  def edit; end

  def new
    respond_with @course = @field.courses.new
  end

  def create
    respond_with(@course = @field.courses.create(course_params))
  end

  def update
    @course.update(course_params)
    respond_with @course
  end

  def destroy
    respond_with @course.destroy
  end


  private

  def set_course
    @course = Course.find(params[:id])
  end

  def set_field
    @field = Field.find(params[:field_id])
  end

  def course_params
    params.require(:course).permit(:name, :description, :teacher_id)
  end
end