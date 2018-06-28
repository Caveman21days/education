class ProjectsController < ApplicationController
<<<<<<< HEAD
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_field, only: [:new, :create, :index]

  authorize_resource

  def new
    respond_with @project = @field.projects.new
  end

  def create
    @project = @field.projects.create(project_params)
    redirect_to @field
  end

  def edit; end

  def update
    @project.update(project_params)
    redirect_to @project.field
  end

  private

  def set_course
    @project = Project.find(params[:id])
  end

  def set_field
    @field = Field.find(params[:field_id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :project_manager_id)
  end
end
=======

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Projects.new
  end

  def create; end

  def edit; end

  def update; end

  def destroy; end
end
>>>>>>> c13ea4d0bf9df0463ee5f82d01255b642fb86b51
