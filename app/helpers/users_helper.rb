module UsersHelper
  def region_name(user)
    User.region[user.region]
  end

  def situational_user_assignments_path
    if controller_name == 'courses'
      return new_course_user_assignment_path(@course)
    else
      return new_project_user_assignment_path(@project)
    end
  end
end
