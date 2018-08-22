class Course < ApplicationRecord
  belongs_to :field

  has_many :user_assignments, as: :assignmentable

  has_many :users, through: :user_assignments
  has_many :issues, as: :issuable
  has_many :user_applications, as: :application_receiver

  has_many :role_applications, as: :role_applicable

  has_many :advanced_abilities, as: :objectable, dependent: :destroy

  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank


  validates :name, :short_description, :description, presence: true


  def check_access(attribute, current_user)
    ua = UserAssignment.where(assignmentable: self, user_id: current_user.id).first
    if !ua.nil?
      user_role = ua.role if !ua.nil?
      if ["sponsor", "field_sponsor", "mentor", "curator"].include?(user_role.name)
        typo_access = AdvancedAbility.where(objectable: self, ability_name: attribute, role_id: user_role.id)
        typo_access.empty? ? false : true
      else
        true
      end
    else
      true
    end
  end
end
