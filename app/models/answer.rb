class Answer < ApplicationRecord
  belongs_to :topic
  belongs_to :author, class_name: "User", foreign_key: :author_id

  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank
end
