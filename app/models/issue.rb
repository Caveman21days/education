class Issue < ApplicationRecord
  has_many :user_assignments, as: :assignmentable

  has_many :users, through: :user_assignments
  has_many :user_answers

  has_many :subissues, class_name: 'Issue', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent, class_name: "Issue", foreign_key: 'parent_id', optional: true

  belongs_to :issuable, polymorphic: true, optional: true

  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank

  belongs_to :author, class_name: "User", foreign_key: :author_id
end
