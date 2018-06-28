class TasksController < ApplicationController
  def index
    project_id = params[:project_id]
    @tasks = Task.where(taskable_id: project_id)
  end

  def show
    @task = Task.find(params[:project_id])
  end

  def new
    @task = Task.new
  end

  def create
    Task.new(task_params)
    if Task.save
      redirect_to @task
    else
      #redirect_to
    end
  end

  def edit; end

  def update; end

  def destroy;end

  private

    def task_params
    params.require(:task).permit(:name, :taskable_id, :taskable_type)
    end

end
