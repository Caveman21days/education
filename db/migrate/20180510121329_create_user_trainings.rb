class CreateUserTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :user_trainings do |t|
      t.integer :student_id
      t.integer :training_id

      t.timestamps
    end
    add_index :user_trainings, [:training_id, :student_id]
  end
end
