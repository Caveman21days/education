class UserApplication < ApplicationRecord
  belongs_to :application_receiver, polymorphic: true, optional: true
  belongs_to :user

end
