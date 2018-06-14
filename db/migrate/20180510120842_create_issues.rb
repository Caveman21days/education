class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.integer :issuable_id
      t.string  :issuable_type
      t.integer :author_id
      t.string  :title, null: false
      t.text    :body, null: false, default: ""

      t.timestamps
    end
    add_index :issues, [:issuable_id, :issuable_type]
  end
end
