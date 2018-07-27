class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_field, only: [:new, :create, :index]

  after_action :set_last_issue_date, only: [:create]

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

  def set_last_issue_date
    @project.update(last_issue_date: @project.created_at)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_field
    @field = Field.find(params[:field_id])
  end

  def project_params
    params.require(:project).permit(
      :name, :short_description, :description,
      :project_manager_id, :stage, :nti, :bortnik, :project_type,
      attachments_attributes: [:file]
    )
  end
end
