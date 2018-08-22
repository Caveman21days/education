class RoleApplication < ApplicationRecord
  # TODO: rename this crap
  belongs_to :role_applicable, polymorphic: true, optional: true

  belongs_to :previous_application, class_name: 'RoleApplication', optional: true

  # who wants to be a certain role
  belongs_to :user

  has_one :reviewer, class_name: 'User'

  # if application is accepted, then the next one can be created
  has_one :next_application, class_name: 'RoleApplication'


  # validates :user, :proposed_role, :required_reviewer_role, :final_reviewer_role, presence: true


  # GETTERS
  def proposed_role
    Role.find(proposed_role_id)
  end

  def required_reviewer_role
    Role.find(required_reviewer_role_id)
  end

  def final_reviewer_role
    Role.find(final_reviewer_role_id)
  end

  def has_been_reviewed
    return status != 'pending'
  end

  def can_be_reviewed_by(user)
    user.super_admin || user.role_in(role_applicable) == required_reviewer_role
  end

  def next_application_required
    return required_reviewer_role != final_reviewer_role
  end

  def reviewer_role_rating
    role_names = nil
    case role_applicable_type
    when 'Project'
      role_names = [
        'student',
        'project_manager',
        'admin'
      ]
    when 'Course'
      role_names = [
        'student',
        'teacher',
        'admin'
      ]
    end

    return role_names.collect {|name| Role.where(name: name).first }
  end

  def next_required_reviewer_role
    reviewer_role_rating[
      reviewer_role_rating.index(required_reviewer_role) + 1
    ]
  end

  def is_reviewable_by(user)
    !(has_been_reviewed || !can_be_reviewed_by(user))
  end
  

  def accept(reviewer)
    if is_reviewable_by(reviewer)
      review('accepted', reviewer)
    end

    # if next step required then proceed to it
    if next_application_required
      return create_next_application()
    end

    # if no next steps required
    # assign a subject's role
    UserAssignment.assign_role(role_applicable, user, proposed_role)
  end


  def reject(reviewer)
    begin
      review('rejected', reviewer)
    rescue Exception
      return
    end
  end


  def review(new_status, reviewer)
    # TODO: change types of exceptions
    if has_been_reviewed
      raise Exception.new('The application has been already reviewed')
    end

    if not can_be_reviewed_by(reviewer)
      raise Exception.new('The application cannot be reviewed by the current user')
    end


    # update status
    update(
      status: new_status,
      reviewer_id: reviewer_id,
    )
  end


  def create_next_application
    return role_applicable.role_applications.create(
      user_id: user_id,
      proposed_role_id: proposed_role_id,
      required_reviewer_role_id: next_required_reviewer_role.id,
      final_reviewer_role_id: final_reviewer_role.id,
      status: 'pending'
    )
  end



 
  
  

  # application can be sent if user had not already sent one or is not already a member
  def self.can_be_sent(user, role_applicable)
    members_ids = role_applicable.users.ids
    applicants_ids = role_applicable.role_applications.collect { |application| application.user_id }
    # i dont know how to use NOT in ruby
    if members_ids.include? user.id or applicants_ids.include? user.id
      return false
    else
      return true
    end
  end
end
  