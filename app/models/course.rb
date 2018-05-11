class Course < ApplicationRecord
  has_many :projects
  has_many :trainings
  has_many :user_courses
  has_many :students, through: :user_courses

  # Попробуйте создать таблицу-справочник и свяжите на уровне базы данных и ActiveRecord пользователей и курс

  validates :name, presence: true

  # На вас остается подумать, какой тут еще необходимый атрибут и как написать на него валидацию!


  belongs_to :curator, class_name: 'User', foreign_key: 'curator_id'

end
