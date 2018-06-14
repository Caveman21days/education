class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.string :info, null: false, default: ""

      t.timestamps
    end
  end
end
