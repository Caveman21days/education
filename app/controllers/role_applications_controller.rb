class RoleApplicationsController < ApplicationController
    before_action :set_role_applicable, only: [:new, :create]
    before_action :set_role_application, only: [:show, :accept, :reject]
  
    authorize_resource
  
    def new
      respond_with @role_application = @role_applicable.role_applications.new
    end
  
    def show
    end
  
    def create
      @role_application = @role_applicable.role_applications.create(
        role_application_params.merge(
          user_id: current_user.id,
          required_reviewer_role_id: required_reviewer_role.id,
          final_reviewer_role_id: final_reviewer_role.id,
          status: 'pending'
        )
      )
      redirect_to @role_applicable
    end
  
    def accept
      @role_application.accept(current_user)
      redirect_to @role_application.role_applicable
    end
  
    def reject
      @role_application.reject(current_user)
      redirect_to @role_application.role_applicable
    end
  
    private
  
    def set_role_application
      @role_application = RoleApplication.find(
          role_application_id
      )
    end
  
    def set_role_applicable
      @role_applicable = role_applicable_object
    end
  
    def role_application_id
      return (params[:id] or params[:role_application_id])
    end

    def role_applicable_object
      if params[:project_id]
        return Project.find(params[:project_id])
      elsif params[:course_id]
        return Course.find(params[:course_id])
      end
    end

    # Configurable logic constants

    def required_reviewer_role
      case @role_applicable.class.name
      when 'Project'
        # if proposed role is `sponsor` or `mentor`
        if proposed_role_id == Role.by_name('sponsor').id || proposed_role_id == Role.by_name('mentor').id
          return Role.by_name('project_manager')
        # if proposed role is `student`
        elsif proposed_role_id == Role.by_name('student').id
          return Role.by_name('project_manager')
        end
      when 'Course'
        # if proposed role is `sponsor`
        if proposed_role_id == Role.by_name('sponsor').id
          return Role.by_name('teacher')
        # if proposed role is `student`
        elsif proposed_role_id == Role.by_name('student').id
          return Role.by_name('teacher')
        end
      when 'Field'
        return Role.by_name('admin')
      end
    end


    def final_reviewer_role
      case @role_applicable.class.name
      when 'Project'
        # if proposed role is `sponsor` or `mentor`
        if proposed_role_id == Role.by_name('sponsor').id || proposed_role_id == Role.by_name('mentor').id
          return Role.by_name('admin')
        # if proposed role is `student`
        elsif proposed_role_id == Role.by_name('student').id
          return Role.by_name('project_manager')
        end
      when 'Course'
        # if proposed role is `sponsor`
        if proposed_role_id == Role.by_name('sponsor').id
          return Role.by_name('admin')
        # if proposed role is `student`
        elsif proposed_role_id == Role.by_name('student').id
          return Role.by_name('teacher')
        end
      when 'Field'
        return Role.by_name('admin')
      end
    end

    def proposed_role_id
      role_application_params[:proposed_role_id].to_i
    end    

    def role_application_params
      params.require(:role_application).permit(
            :proposed_role_id,
            :body
        )
    end
  end
  