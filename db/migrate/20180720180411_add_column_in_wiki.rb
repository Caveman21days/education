class AddColumnInWiki < ActiveRecord::Migration[5.1]
  def change
    add_column :wikis, :wikiable_id, :integer
    add_column :wikis, :wikiable_type, :string
  end
end
