class AddNewFilterFields < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :application_area, :string
    add_column :courses, :application_area, :string
    add_column :projects, :technology, :string
    add_column :courses, :technology, :string
  end
end
