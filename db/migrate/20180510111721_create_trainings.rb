class CreateTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :trainings do |t|
      t.integer :course_id, foreign_key: true
      t.integer :teacher_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
