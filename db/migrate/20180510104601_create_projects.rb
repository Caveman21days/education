class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :project_manager_id
      t.integer :course_id, foreign_key: true

      t.timestamps
    end
    add_index :projects, [:course_id, :project_manager_id]
  end
end
