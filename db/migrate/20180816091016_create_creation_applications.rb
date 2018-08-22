class CreateCreationApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :creation_applications do |t|
      t.integer :creation_applicable_id
      t.string :creation_applicable_type

      t.integer :user_id

      t.string :object_type
      t.text :object_details

      t.integer :user_role_in_object_id

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
