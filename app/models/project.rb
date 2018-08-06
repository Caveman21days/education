class Project < ApplicationRecord
  belongs_to :field

  has_many :user_assignments, as: :assignmentable, dependent: :destroy
  has_many :users,  through: :user_assignments
  has_many :issues, as: :issuable
  has_many :user_applications, as: :application_receiver

  has_many :wikis, as: :wikiable

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

end