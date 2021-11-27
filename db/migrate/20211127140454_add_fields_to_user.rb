class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :salutation, :string
    add_column :users, :middle_name, :string
    add_column :users, :address_line_1, :text
    add_column :users, :address_line_2, :text
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string, :default => 'India'
    add_column :users, :pincode, :integer
    add_column :users, :secondary_phone, :string
    add_column :users, :academic_degrees, :text, array: true, default: []
    add_column :users, :experience, :string
    add_column :users, :practicing, :string
  end
end
