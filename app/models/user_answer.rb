class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :issue

  has_many :attachments, as: :attachable, dependent: :destroy

  accepts_nested_attributes_for :attachments, reject_if: :all_blank
end
