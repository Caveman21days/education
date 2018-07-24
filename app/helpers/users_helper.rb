module UsersHelper
  def region_name(user)
    User.region[user.region]
  end
end
