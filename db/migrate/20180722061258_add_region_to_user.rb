class AddRegionToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :region, :integer
  end
end
