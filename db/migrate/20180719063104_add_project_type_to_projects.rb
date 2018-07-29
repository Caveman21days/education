class AddProjectTypeToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :project_type, :integer
  end
end
