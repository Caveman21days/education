class Task < ApplicationRecord
  has_many :user_tasks
  has_many :users, through: :user_tasks

  # Тут внимательно: свзязь полиморфная, значит, она может принадлежать к нескольким ассоциированным объектам!
  # желательно почитать про полиморфные связи

  belongs_to :taskable, polymorphic: true
end
