class Wiki < ApplicationRecord

  belongs_to :wikiable, polymorphic: true, optional: true
  belongs_to :field

  has_many :attachments, as: :attachable, dependent: :destroy

  accepts_nested_attributes_for :attachments, reject_if: :all_blank

  validates :name, :body, :field_id, presence: true
end
