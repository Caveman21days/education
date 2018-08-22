module FieldsHelper
    def admin_role_applications
        RoleApplication.all.select { |application| application.required_reviewer_role == Role.by_name('admin')}
    end

    def admin_creation_applications
        CreationApplication.all.select { |application| application.required_reviewer_role == Role.by_name('admin')}
    end

    def field_creation_applications
        CreationApplication.all.select { |application| application.creation_applicable == @field && application.required_reviewer_role.name == 'curator'}
    end
  end
  