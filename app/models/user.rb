class User < ApplicationRecord
  has_many :user_courses
  has_many :user_projects
  has_many :user_trainings
  has_many :user_tasks

  has_many :courses, through: :user_courses
  has_many :projects, through: :user_projects
  has_many :trainings, through: :user_trainings
  has_many :tasks, through: :user_tasks

  # Валидации пробуйте писать сами, какие считаете нужными! Для примера - вот:

  validates :f_name, presence: true, length: { in: 1..20 }

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
