class MainField < ApplicationRecord
  has_many :fields

  has_many :creation_applications, as: :creation_applicable
end
