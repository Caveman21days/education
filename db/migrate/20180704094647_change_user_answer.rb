class ChangeUserAnswer < ActiveRecord::Migration[5.1]
  def change
    rename_column :user_answers, :recipient, :recipient_id
    add_column :user_answers, :status, :string
  end
end
