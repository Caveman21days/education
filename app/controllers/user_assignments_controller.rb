class UserAssignmentsController < ApplicationController
  before_action :set_user_assignment, only: [:show, :edit, :update, :destroy]
  before_action :assignmentable_object

  authorize_resource through: @assignmentable

  def index
    @user_assignments = @assignmentable.user_assignments
  end

  def new
    if check_access(@assignmentable)
      respond_with @user_assignment = @assignmentable.user_assignments.new
    else
      redirect_to @assignmentable, alert: 'У вас нет прав доступа!'
    end
  end

  def show
    respond_with @user_assignment
  end

  def edit; end

  def create
    @assignmentable.user_assignments.create(user_assignments_params)
    redirect_to @assignmentable
  end

  def update
    if check_access(@assignmentable)
      @user_assignment.update(user_assignments_params)
      redirect_to @user_assignment.assignmentable
    else
      redirect_to @assignmentable, alert: 'У вас нет прав доступа!'
    end
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
    @assignmentable = if params[:field_id]
      Field.find(params[:field_id])
    elsif params[:project_id]
      Project.find(params[:project_id])
    elsif params[:course_id]
      Course.find(params[:course_id])
    elsif params[:issue_id]
      Issue.find(params[:issue_id])
    elsif params[:wiki_id]
      Wiki.find(params[:wiki_id])
                      end
    @assignmentable
  end

  def user_assignments_params
    params.require(:user_assignment).permit(:user_id, :role_id, :issue_state)
  end

  def check_access(assignmentable)
    if assignmentable.class.name == "Course"
      !current_user.user_assignments.where(role_id: Role.find_by(name: 'teacher')).empty? ? true : false
    elsif assignmentable.class.name == "Project"
      !current_user.user_assignments.where(role_id: Role.find_by(name: 'project_manager')).empty? ? true : false
    end
  end

end
