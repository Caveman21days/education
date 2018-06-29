class UserAssignment < ApplicationRecord
  belongs_to :assignmentable, polymorphic: true
  belongs_to :user
  belongs_to :role
end