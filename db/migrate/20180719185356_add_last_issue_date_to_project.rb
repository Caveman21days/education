class AddLastIssueDateToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :last_issue_date, :datetime
  end
end
