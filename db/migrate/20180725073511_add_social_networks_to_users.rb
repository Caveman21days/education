class AddSocialNetworksToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :vk_profile, :string
    add_column :users, :telegram_profile, :string
  end
end
