class UserAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :assignmentable, polymorphic: true
end