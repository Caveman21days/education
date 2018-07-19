class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :body
      t.integer :topic_id
      t.integer :author_id

      t.timestamps
    end
  end
end
