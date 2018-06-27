class Field < ApplicationRecord
  has_many :user_assignments, as: :assignmentable

  has_many :projects
  has_many :courses
  has_many :users, through: :user_assignments


  validates :name, presence: true

  # belongs_to :curator, class_name: 'User', foreign_key: 'curator_id'
end
