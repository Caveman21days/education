class Course < ApplicationRecord
  belongs_to :field

  has_many :user_assignments, as: :assignmentable

  has_many :users, through: :user_assignments
  has_many :issues, as: :issuable

  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank


  validates :name, :short_description, :description, presence: true
end
