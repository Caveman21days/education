class CreateMainFields < ActiveRecord::Migration[5.1]
  def change
    create_table :main_fields do |t|
      t.string :name
      t.text :description
      t.integer :curator_id

      t.timestamps
    end
  end
end
