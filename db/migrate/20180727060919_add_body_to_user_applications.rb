class AddBodyToUserApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :user_applications, :body, :text
  end
end
