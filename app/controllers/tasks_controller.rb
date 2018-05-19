class TasksController < ApplicationController

  def index
    project_id = params[:project_id]
    @tasks = Task.where(taskable_id: project_id)
  end

  def show
    @task = Task.find(params[:project_id])
  end

  def new
    @Task = Task.new
  end

  def create; end

  def edit; end

  def update; end

  def destroy; end

end
