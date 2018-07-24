class Project < ApplicationRecord
  belongs_to :field

  has_many :user_assignments, as: :assignmentable, dependent: :destroy
  has_many :users,  through: :user_assignments
  has_many :issues, as: :issuable

  validates :name, :short_description, :description, presence: true

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
      'Прочее',
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
      'Прочее',
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
