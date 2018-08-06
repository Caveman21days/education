class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.string :file
      t.string :attachable_id
      t.string :attachable_type

      t.timestamps
    end
  end
  
end
