class ProjectsController < ApplicationController

  #Можно писать так
  # тупо поменял слова пока что
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  #Можно и так, если ничего внутри нет
  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end
end
