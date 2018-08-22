class CreateRoleApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :role_applications do |t|
      t.integer :role_applicable_id
      t.string :role_applicable_type

      t.integer :user_id

      t.integer :proposed_role_id

      t.text :body

      t.integer :reviewer_id

      t.integer :required_reviewer_role_id
      t.integer :final_reviewer_role_id

      t.string :status

      t.integer :previous_application_id
      t.integer :next_application_id

      t.timestamps
    end
  end
end
