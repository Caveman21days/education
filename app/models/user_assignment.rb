class UserAssignment < ApplicationRecord
  belongs_to :assignmentable, polymorphic: true, inverse_of: :user_assignments
  belongs_to :user, inverse_of: :user_assignments
  belongs_to :role, inverse_of: :user_assignments
end