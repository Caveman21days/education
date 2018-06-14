class Project < ApplicationRecord
  belongs_to :field

  has_many :users
  has_many :issues
  has_many :users,  through: :user_assignments
  has_many :issues, through: :user_assignments, dependent: :destroy
end
