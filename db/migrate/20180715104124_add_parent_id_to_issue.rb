class AddParentIdToIssue < ActiveRecord::Migration[5.1]
  def change
  	add_column :issues, :parent_id, :integer
  end
end
