class User < ApplicationRecord
  has_many :fields
  has_many :courses
  has_many :projects
  has_many :issues
  has_many :roles

  has_many :fields,   through: :user_assignments
  has_many :courses,  through: :user_assignments
  has_many :projects, through: :user_assignments
  has_many :issues,   through: :user_assignments
  has_many :roles,    through: :user_assignments


  validates :f_name, presence: true, length: { in: 1..20 }

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
