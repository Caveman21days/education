class CreateUserProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :user_projects do |t|
      t.integer :course_id
      t.integer :student_id
      t.integer :project_id

      t.timestamps
    end
    add_index :user_projects, [:course_id, :student_id, :project_id]
  end
end
