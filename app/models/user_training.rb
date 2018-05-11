class UserTraining < ApplicationRecord
  belongs_to :training
  belongs_to :student, class_name: 'User'
end
