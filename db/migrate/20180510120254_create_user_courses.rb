class CreateUserCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_courses do |t|
      t.integer :course_id
      t.integer :student_id

      t.timestamps
    end
    add_index :user_courses, [:course_id, :student_id]
  end
end
