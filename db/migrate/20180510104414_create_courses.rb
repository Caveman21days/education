class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.integer :curator_id

      t.timestamps
    end
    add_index :courses, :curator_id
  end
end
