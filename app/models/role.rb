class Role < ApplicationRecord
  has_many :user_assignments, as: :assignmentable

  has_many :users, through: :user_assignments

  def self.by_name(name)
    return Role.where(name: name).first
  end
end