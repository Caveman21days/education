class RemoveUsersFromModels < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :teacher_id
    remove_column :fields, :curator_id
    remove_column :projects, :project_manager_id

    add_column :user_assignments, :issue_state, :string
    add_column :user_answers, :recipient, :integer
  end
end
