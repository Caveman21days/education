class CreateForums < ActiveRecord::Migration[5.1]
  def change
    create_table :forums do |t|
      t.integer :user_id, foreign_key: true
      t.string :topic_name
      t.text :description

      t.timestamps
    end
    add_index :forums, :user_id
  end
end
