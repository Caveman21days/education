class UserAssignment < ApplicationRecord
  belongs_to :assignmentable, polymorphic: true, inverse_of: :user_assignments
  belongs_to :user, inverse_of: :user_assignments
  belongs_to :role, inverse_of: :user_assignments

  def self.assign_role(object, user, role)
    assignmentable_params = {
      assignmentable_type: object.class.name,
      assignmentable_id: object.id,
      user_id: user.id,
      role_id: role.id
    }
    UserAssignment.create(assignmentable_params)
  end
end