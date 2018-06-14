class UserAssignment < ApplicationRecor
  belongs_to :user
  belongs_to :role
  belongs_to :assignmentable, polymorphic: true
end