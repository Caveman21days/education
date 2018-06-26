class Course < ApplicationRecord
  belongs_to :field

  has_many :user_assignments, as: :assignmentable

  has_many :users, through: :user_assignments
  has_many :issues, as: :issuable

end
