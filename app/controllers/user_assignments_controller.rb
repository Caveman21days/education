class UserAssignmentsController < ApplicationController
  authorize_resource

  before_action :set_user_assignment, only: [:update, :destroy]
  before_action :assignmentable_object, only: :create


  def create
    assignmentable_params = { assignmentable_type: assignmentable_object.class.name, assignmentable_id: assignmentable_object.id }
    current_user.user_assignments.create(user_assignments_params.merge(assignmentable_params))
    redirect_to assignmentable_object
  end

  def update
    @user_assignment.update(user_assignments_params)
    redirect_to @user_assignment.assignmentable
  end

  def destroy
    @user_assignment.destroy
    redirect_to root_path
  end


  private

  # def assignmentable_object
  #   klass = params[:assignmentable_type].classify.constantize
  #   klass.find(params[:assignmentable_id])
  # end

  def set_user_assignment
    @user_assignment = UserAssignment.find(params[:id])
  end

  def assignmentable_object
    if params[:field_id]
      Field.find(params[:field_id])
    elsif params[:project_id]
      Project.find(params[:project_id])
    elsif params[:course_id]
      Course.find(params[:course_id])
    elsif params[:issue_id]
      Issue.find(params[:issue_id])
    end
  end

  def user_assignments_params
    params.require(:user_assignment).permit(:role_id, :date_start, :date_end, :issue_status)
  end
end