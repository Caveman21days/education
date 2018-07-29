class CreateUserApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :user_applications do |t|
      t.integer :application_receiver_id
      t.string :application_receiver_type
      t.integer :user_id

      t.timestamps
    end
    add_index :user_applications, [:application_receiver_id, :user_id]
  end
end
