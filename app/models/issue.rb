class Issue < ApplicationRecord
  has_many :user_assignments, as: :assignmentable

  has_many :users, through: :user_assignments
  has_many :user_answers

  belongs_to :issuable, polymorphic: true, optional: true
end
