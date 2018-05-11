class UserTask < ApplicationRecord
  belongs_to :task
  belongs_to :student, class_name: 'User'
end
