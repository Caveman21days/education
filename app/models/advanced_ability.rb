class AdvancedAbility < ApplicationRecord
  belongs_to :objectable, polymorphic: true, optional: true
  belongs_to :role
end