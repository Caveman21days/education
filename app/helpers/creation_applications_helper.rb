module CreationApplicationsHelper
    def object_types_select_options
        if params[:object_type].nil?
            return @object_types
        else
            return [params[:object_type], *(@object_types.select { |option| option != params[:object_type]})]
        end
    end

    def can_be_reviewed
        @creation_application.can_be_reviewed_by(current_user) && !@creation_application.has_been_reviewed
    end
  end
  