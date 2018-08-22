class UserApplication < ApplicationRecord
  belongs_to :application_receiver, polymorphic: true, optional: true
  belongs_to :user

  serialize :details, Hash


  def self.compose(proposer, application_receiver, object, subject, role)
    UserApplication.create(
      proposed_by: current_user.id,
      subject_id: subject.id,
      subject_role_id: role.id,
      object_id: object.id,
      object_type: object.class.name,
      application_receiver_type: application_receiver.class.name
    )
  end


  def accept
    # update status
    update(status: 'accepted')

    # if next step required then proceed to it
    if next_application_required
      return compose_next_application()
    end

    if creates_object
      # this application's goal is to create an object
      object_class.create(details)
    end

    # assign a subject's role
    UserAssignment.assign_role(object, subject, subject_role)
  end


  def reject
    update(status: 'rejected')
  end


  def compose_next_application
    return UserApplication.compose(proposer, application_receiver, object, subject, role)
  end


  # if application is aimed to add a Project/Course...
  def creates_object
    return object.nil?
  end


  def is_next_application_required(application)
    return application.application_receiver_type != application.required_application_receiver_type
  end


  def proposer
    return User.find(proposed_by)
  end

  def application_receiver
    return application_receiver_type.constantize.find(application_receiver_id)
  end


  def subject
    return User.find(subject_id)
  end



  def subject_role
    return Role.find(subject_role_id)
  end


  def object_class
    object_class = object_type.constantize
  end


  def object
    # unless object_id.nil?
    #   return object_class.find(object_id)
    # end

    # return object_class.new(details)

    if object_id.nil?
      return nil
    end

    return object_class.find(object_id)
  end



  def next_application
    if next_application_id.nil?
      return nil
    else
      return UserApplication.find(next_application_id)
    end
  end


  def reviewer
    if reviewer_id.nil?
      return nil
    else
      return User.find(reviewer_id)
    end
  end


  def self.can_be_created(user, application_receiver)
    return true

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
