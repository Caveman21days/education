class CreateUserAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :user_assignments do |t|
      t.integer :assignmentable_id
      t.string  :assignmentable_type
      t.integer :user_id
      t.integer :role_id

      t.datetime :date_start
      t.datetime :date_end

      t.timestamps
    end
    add_index :user_assignments, [:assignmentable_id, :user_id]
  end
end
