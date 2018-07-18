class CreateWikis < ActiveRecord::Migration[5.1]
  def change
    create_table :wikis do |t|
      t.integer :field_id
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
