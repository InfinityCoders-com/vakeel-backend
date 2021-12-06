class AddOtpToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :encrypted_otp, :string
    add_column :users, :encrypted_otp_iv, :string
    add_column :users, :encrypted_password, :string
    add_column :users, :encrypted_password_iv, :string
  end
end
