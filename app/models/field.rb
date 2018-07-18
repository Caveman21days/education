class Field < ApplicationRecord
  has_many :user_assignments, as: :assignmentable

  has_many :projects
  has_many :courses
  has_many :wikis
  has_many :users, through: :user_assignments


  validates :name, :short_description, :description, presence: true

  # belongs_to :curator, class_name: 'User', foreign_key: 'curator_id'
end
