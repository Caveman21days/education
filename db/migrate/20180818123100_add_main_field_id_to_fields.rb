class AddMainFieldIdToFields < ActiveRecord::Migration[5.1]
  def change
    add_column :fields, :main_field_id, :integer
  end
end
