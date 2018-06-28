class Course < ApplicationRecord
  belongs_to :field

  has_many :user_assignments, as: :assignmentable

<<<<<<< HEAD
  has_many :users, through: :user_assignments
  has_many :issues, as: :issuable
=======
  validates :name, presence: true, length: { in: 1..20 }
  validates :description, presence: true, length: {in: 1..100}
  validates :curator_id, presence: true


  # На вас остается подумать, какой тут еще необходимый атрибут и как написать на него валидацию!


  belongs_to :curator, class_name: 'User', foreign_key: 'curator_id'
>>>>>>> c13ea4d0bf9df0463ee5f82d01255b642fb86b51

end
