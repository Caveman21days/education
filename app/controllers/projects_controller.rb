class ProjectsController < ApplicationController

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
