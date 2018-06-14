class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.integer :field_id, foreign_key: true
      t.integer :teacher_id
      t.string  :name
      t.text    :description

      t.timestamps
    end
  end
end
