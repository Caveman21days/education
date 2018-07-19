class Wiki < ApplicationRecord
  has_many :user_assignments, as: :assignmentable

  belongs_to :field

  validates :name, :body, :field_id, presence: true
end
