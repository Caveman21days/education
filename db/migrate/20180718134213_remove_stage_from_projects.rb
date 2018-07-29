class RemoveStageFromProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :stage
  end
end
