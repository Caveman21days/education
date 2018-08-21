class AddAccessToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :access, :boolean
  end
end
