class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :body
      t.string :section
      t.integer :author_id

      t.timestamps
    end
  end
end
