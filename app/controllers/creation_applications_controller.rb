class CreationApplicationsController < ApplicationController
    before_action :set_creation_applicable, only: [:new, :create]
    before_action :set_creation_application, only: [:show, :accept, :reject]
    before_action :set_object_types, only: [:new]
  
    authorize_resource
  
    def new
      respond_with @creation_application = @creation_applicable.creation_applications.new
    end
  
    def show
    end
  
    def create
      @creation_application = @creation_applicable.creation_applications.create(
        creation_application_params.merge(
          user_id: current_user.id,
          user_role_in_object_id: user_role_in_object.id,
          required_reviewer_role_id: required_reviewer_role.id,
          final_reviewer_role_id: final_reviewer_role.id,
          status: 'pending'
        )
      )
      redirect_to @creation_applicable
    end
  
    def accept
      @creation_application.accept(current_user)
      redirect_to @creation_application.creation_applicable
    end
  
    def reject
      @creation_application.reject(current_user)
      redirect_to @creation_application.creation_applicable
    end
  
    private
  
    def set_creation_application
      @creation_application = CreationApplication.find(
          creation_application_id
      )
    end
  
    def set_creation_applicable
      @creation_applicable = creation_applicable_object
    end

    def set_object_types
      case @creation_applicable.class.name
      when 'Field'
        @object_types = ['Project', 'Course']
      end
    end
  
    def creation_application_id
      return (params[:id] or params[:creation_application_id])
    end


    def creation_applicable_object
      if params[:field_id]
        return Field.find(params[:field_id])
      end
    end

    # Configurable logic constants

    def user_role_in_object
      case creation_application_params[:object_type]
      when 'Project'
        return Role.by_name('project_manager')
      when 'Course'
        return Role.by_name('teacher')
      when 'Field'
        return Role.by_name('curator')
      end
    end

    def required_reviewer_role
      case creation_application_params[:object_type]
      when 'Project'
        return Role.by_name('curator')
      when 'Course'
        return Role.by_name('curator')
      when 'Field'
        return Role.by_name('admin')
      end
    end


    def final_reviewer_role
      Role.by_name('admin')
    end

    # params permits

    def creation_application_params
      params.require(:creation_application).permit(
            :object_type,
            :body,
            :object_details => object_details_params
      )
    end

    def object_details_params
      case params[:creation_application][:object_type]
      when 'Project'
        return [:name, :short_description, :description,
          :project_manager_id, :cofield_id,
          :stage, :nti, :bortnik, :project_type]
      when 'Course'
        return [:name, :short_description, :description]
      end
    end
  end
  