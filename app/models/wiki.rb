class Wiki < ApplicationRecord

  belongs_to :wikiable, polymorphic: true, optional: true
  belongs_to :field

  validates :name, :body, :field_id, presence: true
end
