class UserAssignmentsController < ApplicationController
  authorize_resource

  before_action :set_user_assignment, only: [:show, :edit, :update, :destroy]


  def index
    @assignmentable = assignmentable_object
    @user_assignments = UserAssignment.where(assignmentable_type: assignmentable_object.class.name, assignmentable_id: assignmentable_object.id)
  end

  def new
    @assignmentable = assignmentable_object
    @user_assignment = UserAssignment.new
  end

  def show
    respond_with @user_assignment
  end

  def edit; end

  def create
    assignmentable_params = { assignmentable_type: assignmentable_object.class.name, assignmentable_id: assignmentable_object.id }
    UserAssignment.create(user_assignments_params.merge(assignmentable_params))
    redirect_to assignmentable_object
  end

  def update
    @user_assignment.update(user_assignments_params)
    redirect_to @user_assignment.assignmentable
  end

  def destroy
    assignmentable = @user_assignment.assignmentable
    @user_assignment.destroy
    redirect_to assignmentable
  end




  private

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
    params.require(:user_assignment).permit(:user_id, :role_id, :date_start, :date_end, :issue_state)
  end
end



# def user_assignment_existence
#   UserAssignment.where(assignmentable_id: assignmentable_object.id, assignmentable_type: assignmentable_object.class.name)
# end


# def init_user_assignment
#   if user_assignment_existence.empty?
#     @user_assignment = current_user.user_assignments.new
#   else
#     @user_assignment = user_assignment_existence.first
#   end
#
#   render @user_assignment
# end
#
# def set_settings
#   if user_assignment_existence.empty?
#     assignmentable_params = { assignmentable_type: assignmentable_object.class.name, assignmentable_id: assignmentable_object.id }
#     current_user.user_assignments.create(user_assignments_params.merge(assignmentable_params))
#   else
#     user_assignment_existence.first.update(user_assignments_params)
#   end
# end