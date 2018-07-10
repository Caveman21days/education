class IssuesController < ApplicationController

  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_action :set_issuable, only: [:new, :create, :index]

  authorize_resource

  def new
    respond_with @issue = @issuable.issues.new
  end

  def show
    @user_answer = @issue.user_answers.new
    respond_with @issue
  end

  def edit; end

  def create
    @issue = @issuable.issues.create(issue_params.merge(author_id: current_user.id))
    redirect_to @issuable
  end

  def update
    @issue.update(issue_params)
    redirect_to @issue.issuable
  end

  def destroy
    issuable = @issue.issuable
    @issue.destroy
    redirect_to issuable
  end


  private

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def set_issuable
    @issuable = issuable_object
  end

  def issue_params
    params.require(:issue).permit(:title, :body, :teacher_id)
  end

  def issuable_object
    if params[:project_id]
      Project.find(params[:project_id])
    elsif params[:course_id]
      Course.find(params[:course_id])
    end
  end
end