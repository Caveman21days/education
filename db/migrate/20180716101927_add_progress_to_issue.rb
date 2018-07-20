class AddProgressToIssue < ActiveRecord::Migration[5.1]
  def change
  	add_column :issues, :progress, :integer, default: 0, not_null: true
  end
end
