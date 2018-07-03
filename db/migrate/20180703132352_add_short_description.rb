class AddShortDescription < ActiveRecord::Migration[5.1]
  def change
    add_column :fields, :short_description, :string, null: false, default: ""
    add_column :courses, :short_description, :string, null: false, default: ""
    add_column :projects, :short_description, :string, null: false, default: ""
  end
end
