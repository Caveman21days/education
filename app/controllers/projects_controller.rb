class ProjectsController < ApplicationController
  before_action :set_project, :set_stage_name, :set_nti_name, :set_bortnik_name, :set_project_type_name, only: [:show, :edit, :update, :destroy]
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

  def set_project_type_name
    @project_type_name = Project.project_type[@project.project_type]
  end

  def set_bortnik_name
    @bortnik_name = Project.bortnik[@project.bortnik]
  end

  def set_nti_name
    @nti_name = Project.nti[@project.nti]
  end

  def set_stage_name
    all_stages = Project.stages
    @stage_name = all_stages[@project.stage]
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_field
    @field = Field.find(params[:field_id])
  end

  def project_params
    params.require(:project).permit(:name, :short_description, :description, :project_manager_id, :stage, :nti, :bortnik, :project_type)
  end
end
