class Project < ApplicationRecord
  belongs_to :field

  has_many :user_assignments, as: :assignmentable, dependent: :destroy
  has_many :users,  through: :user_assignments
  has_many :issues, as: :issuable
  has_many :wikis, as: :wikiable

  validates :name, :short_description, :description, presence: true
end
