class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_field, only: [:new, :create, :index]

  authorize_resource


  def index
    respond_with @courses = @field.courses
  end

  def new
    respond_with @course = @field.courses.new
  end

  def show
<<<<<<< HEAD
    @issues = @course.issues
    respond_with @course
  end

  def edit; end

  def create
    @course = @field.courses.create(course_params)
    redirect_to @field
  end

  def update
    @course.update(course_params)
    redirect_to @course.field
  end

  def destroy
    field = @course.field
    @course.destroy
    redirect_to field
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
=======
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create; end

  def edit; end

  def update; end

  def destroy; end
end
>>>>>>> c13ea4d0bf9df0463ee5f82d01255b642fb86b51
