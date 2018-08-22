class Field < ApplicationRecord
  belongs_to :main_field

  has_many :user_assignments, as: :assignmentable

  has_many :projects
  has_many :courses
  has_many :wikis
  has_many :users, through: :user_assignments

  has_many :user_applications, as: :application_receiver

  has_many :creation_applications, as: :creation_applicable
  has_many :role_applications, as: :role_applicable


  validates :name, :short_description, :description, presence: true
  # belongs_to :curator, class_name: 'User', foreign_key: 'curator_id'


end
