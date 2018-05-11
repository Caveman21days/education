class Training < ApplicationRecord
  belongs_to :course

  has_many :user_projects
  has_many :user_tasks
  has_many :students, through: :user_projects #связь многие ко многим через справочник
  has_many :tasks, as: :taskable, through: :user_tasks, dependent: :destroy
end
