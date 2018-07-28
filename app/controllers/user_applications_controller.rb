class UserApplicationsController < ApplicationController
  before_action :set_application_receiver_from_params, only: [:new, :create]
  before_action :set_user_application, only: [:show]
  before_action :set_user_application_weird_way, only: [:accept, :reject]
  before_action :set_application_receiver_from_application, only: [:show, :accept, :reject]

  authorize_resource

  def new
    respond_with @user_application = @application_receiver.user_applications.new
  end

  def show
    # create an sasignment just in case user accepts the application
    @user_assignment = UserAssignment.new
  end

  def create
    unless UserApplication.can_be_created(current_user, @application_receiver)
      print('=============Couldnt create an application =================')
      redirect_to @application_receiver
      return
    end

    params_with_user_id = {
      user_id: current_user.id
    }
    @user_application = @application_receiver.user_applications.create(
      user_application_params.merge(params_with_user_id)
    )
    redirect_to @application_receiver
  end

  def accept
    assignmentable_params = {
      assignmentable_type: @application_receiver.class.name,
      assignmentable_id: @application_receiver.id,
      user_id: @user_application.user_id,
      role_id: Role.where(name: 'student')[0].id
    }
    print('PENIS', assignmentable_params)
    UserAssignment.create(assignmentable_params)
    @user_application.destroy
    redirect_to @application_receiver
  end

  def reject
    @user_application.destroy
    redirect_to @application_receiver
  end

  private

  def set_user_application
    @user_application = UserApplication.find(params[:id])
  end

  def set_user_application_weird_way
    @user_application = UserApplication.find(params[:user_application_id])
  end

  def set_application_receiver_from_params
    @application_receiver = application_receiver_object_from_params
  end

  def set_application_receiver_from_application
    @application_receiver = application_receiver_object_from_application
  end

  def application_receiver_object_from_params
    if params[:project_id]
      return Project.find(params[:project_id])
    elsif params[:course_id]
      return Course.find(params[:course_id])
    end
  end

  def application_receiver_object_from_application
    case @user_application.application_receiver_type
    when 'Project'
      return Project.find(@user_application.application_receiver_id)
    when 'Course'
      return Course.find(@user_application.application_receiver_id)
    end
  end

  def user_application_params
    params.require(:user_application).permit(:body)
  end
end
