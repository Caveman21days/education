class CreateUserTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tasks do |t|
      t.integer :student_id
      t.integer :project_id
      t.integer :task_id

      t.timestamps
    end
    add_index :user_tasks, [:student_id, :task_id, :project_id]
  end
end
