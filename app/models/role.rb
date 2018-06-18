class Role < ApplicationRecord
  has_many :user_assignments
  has_many :users
  has_many :users, through: :user_assignments
end