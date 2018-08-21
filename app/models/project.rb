class Project < ApplicationRecord
  belongs_to :field

  has_many :user_assignments, as: :assignmentable, dependent: :destroy
  has_many :users,  through: :user_assignments
  has_many :issues, as: :issuable
  has_many :user_applications, as: :application_receiver

  has_many :wikis, as: :wikiable
  has_many :advanced_abilities, as: :objectable, dependent: :destroy

  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank

  validates :name, :short_description, :description, presence: true


  def cofield
    if cofield_id.nil?
      return nil
    else
      return Field.find(cofield_id)
    end
  end

  def self.stages
    return [
      'Идея',
      'Учебный проект',
      'Создание прототипа',
      'Опытное внедрение',
      'Коммерциализация',
      'Масштабирование'
    ]
  end

  validates :stage, inclusion: { in: [*0..(Project.stages.length - 1)],
    message: 'The stage you selected is not valid' }, presence: true

  def self.nti
    return [
      '—',
      'AeroNet',
      'AutoNet',
      'MariNet',
      'NeuroNet',
      'HealthNet',
      'FoodNet',
      'EnergyNet',
      'SafeNet',
      'FinNet'
    ]
  end

  validates :nti, inclusion: { in: [*0..(Project.nti.length - 1)],
    message: 'Выбранная НТИ не найдена' }, presence: true

  def self.bortnik
    return[
      '—',
      'Н1. Цифровые технологии',
      'Н2. Медицина и технологии здоровьесбережения',
      'Н3. Новые материалы и химические технологии',
      'Н4. Новые приборы и интеллектуальные производственные технологии',
      'Н5. Биотехнологии',
      'Н6. Ресурсосберегающая энергетика',
    ]
  end

  validates :bortnik, inclusion: { in: [*0..(Project.bortnik.length - 1)],
    message: 'Выбранный классификатор бортника не корректен' }, presence: true

  def self.project_type
    return [
      'Школьный',
      'Студенческий',
      'Сложный',
      'Профессиональный',
    ]
  end

  validates :project_type, inclusion: { in: [*0..(Project.project_type.length - 1)],
    message: 'Выбранный классификатор не корректен' }, presence: true


  def check_access(attribute, current_user)
    ua = UserAssignment.where(assignmentable: self, user_id: current_user.id).first
    if !ua.nil?
      user_role = ua.role if !ua.nil?
      if ["sponsor", "field_sponsor", "mentor", "curator"].include?(user_role.name)
        true if user.role.name == 'mentor' && attribute == 'card'
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