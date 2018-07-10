class User < ApplicationRecord
  has_many :user_assignments, dependent: :destroy

  has_many :fields, through: :user_assignments, source: :assignmentable, source_type: 'Field'
  has_many :projects, through: :user_assignments, source: :assignmentable, source_type: 'Project'
  has_many :issues, through: :user_assignments, source: :assignmentable, source_type: 'Issue'
  has_many :roles, through: :user_assignments, source: :assignmentable, source_type: 'Role'
  has_many :courses, through: :user_assignments, source: :assignmentable, source_type: 'Course'

  has_many :user_answers

  # validates :f_name, presence: true, length: { in: 1..20 }

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
