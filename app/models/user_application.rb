class UserApplication < ApplicationRecord
  belongs_to :application_receiver, polymorphic: true, optional: true
  belongs_to :user

  def self.can_be_created(user, application_receiver)
    members_ids = application_receiver.users.ids
    applicants_ids = application_receiver.user_applications.collect { |application| application.user_id }

    # i dont know how to use NOT in ruby
    if members_ids.include? user.id or applicants_ids.include? user.id
      return false
    else
      return true
    end
  end
end
