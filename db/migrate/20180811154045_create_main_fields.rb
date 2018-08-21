class CreateMainFields < ActiveRecord::Migration[5.1]
  def change
    create_table :main_fields do |t|
      t.string :name
      t.string :short_description
      t.text :description

      t.timestamps
    end
  end
end
