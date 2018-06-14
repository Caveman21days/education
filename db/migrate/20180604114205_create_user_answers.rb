class CreateUserAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_answers do |t|
      t.integer :user_id
      t.integer :user_issue_id
      t.text    :body
    end
  end
end
