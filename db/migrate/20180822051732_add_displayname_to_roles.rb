class AddDisplaynameToRoles < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :display_name, :string
  end
end
