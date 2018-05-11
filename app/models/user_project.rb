class UserProject < ApplicationRecord
  belongs_to :project
  belongs_to :student, class_name: 'User'
end
