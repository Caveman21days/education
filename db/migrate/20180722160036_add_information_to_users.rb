class AddInformationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :house, :string
    add_column :users, :street, :string
    add_column :users, :apartment, :string
    add_column :users, :phone_number, :string
    add_column :users, :school, :string
    add_column :users, :school_graduation_date, :date
    add_column :users, :university, :string
    add_column :users, :university_graduation_date, :date
    add_column :users, :birth_date, :date
    add_column :users, :second_language, :string
    add_column :users, :award, :string
  end
end
