class Issue < ApplicationRecord
  has_many :users
  has_many :users, through: :user_assignments
  has_many :user_answers
end
