module UsersHelper
  def region_name(user)
    User.region[user.region]
  end

  def situational_user_assigments_path
    if controller_name == 'courses'
      return course_user_assignments_path(@course)
    else
      return project_user_assignments_path(@project)
    end
  end
end
