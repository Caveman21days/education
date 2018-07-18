class Role < ApplicationRecord
  has_many :user_assignments, as: :assignmentable

  has_many :users, through: :user_assignments
end