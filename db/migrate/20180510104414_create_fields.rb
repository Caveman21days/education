class CreateFields < ActiveRecord::Migration[5.1]
  def change
    create_table :fields do |t|
      t.string :name
      t.text :description
      t.integer :curator_id

      t.timestamps
    end
    add_index :fields, :curator_id
  end
end
