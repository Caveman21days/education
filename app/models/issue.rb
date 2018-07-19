class Issue < ApplicationRecord
  has_many :user_assignments, as: :assignmentable

  has_many :users, through: :user_assignments
  has_many :user_answers

  has_many :subissues, class_name: 'Issue', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent, class_name: "Issue", foreign_key: 'parent_id', optional: true

  belongs_to :issuable, polymorphic: true, optional: true
end
