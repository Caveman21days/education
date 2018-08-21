class AdvancedAbilities < ActiveRecord::Migration[5.1]
  def change
    create_table :advanced_abilities do |t|
      t.integer :objectable_id
      t.string :objectable_type
      t.string :role_id
      t.string :ability_name
      t.string :access

      t.timestamps
    end

    add_index :advanced_abilities, [:objectable_id, :objectable_type]
  end
end
