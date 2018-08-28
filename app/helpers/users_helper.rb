module UsersHelper
  def region_name(user)
    User.region[user.region]
  end

  def situational_user_assignments_path
    if controller_name == 'courses'
      return new_course_user_assignment_path(@course)
    elsif controller_name == 'projects'
      return new_project_user_assignment_path(@project)
    elsif controller_name == 'fields'
      return new_field_user_assignment_path(@field)
    end
  end
end
