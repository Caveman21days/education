class AddCofieldToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :cofield_id, :integer
  end
end
