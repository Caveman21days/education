class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :taskable_id
      t.string  :taskable_type

      t.timestamps
    end
    add_index :tasks, [:taskable_id, :taskable_type]
  end
end
