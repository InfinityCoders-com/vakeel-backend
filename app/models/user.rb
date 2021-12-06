class User < ApplicationRecord
  validates :email, uniqueness: true
  attr_encrypted :security_answer, key: "9\xA4\xCDceM\x1Fi`\x1CL\xB2\x95\x92R^|\xE3\x9E\xFF\xBC\xEA\xF7\x90\x9F\xB7\x1A({5\x81T"
  attr_encrypted :otp, key: "9\xA4\xCDceM\x1Fi`\x1CL\xB2\x95\x92R^|\xE3\x9E\xFF\xBC\xEA\xF7\x90\x9F\xB7\x1A({5\x81T"
  attr_encrypted :password, key: "9\xA4\xCDceM\x1Fi`\x1CL\xB2\x95\x92R^|\xE3\x9E\xFF\xBC\xEA\xF7\x90\x9F\xB7\x1A({5\x81T"
  scope :advocates, -> { where(role_name: 'advocate') }
  scope :clients, -> { where(role_name: 'client') }
  has_one_attached :council_id
  has_one_attached :profile_pic

  def user_details
    temp_hash = {}
    temp_hash[:id] = id
    temp_hash[:first_name] = first_name
    temp_hash[:last_name] = last_name
    temp_hash[:email] = email
    temp_hash[:phone_number] = id
    temp_hash[:role_name] = role_name
    temp_hash[:salutation] = salutation
    temp_hash[:middle_name] = middle_name
    temp_hash[:address_line_1] = address_line_1
    temp_hash[:address_line_2] = address_line_2
    temp_hash[:city] = city
    temp_hash[:state] = state
    temp_hash[:country] = country
    temp_hash[:pincode] = pincode
    temp_hash[:secondary_phone] = secondary_phone
    temp_hash[:academic_degrees] = academic_degrees
    temp_hash[:experience] = experience
    temp_hash[:practicing] = practicing
    # temp_hash[:council_id] = rails_storage_proxy_path(council_id)
    # temp_hash[:profile_pic] = rails_storage_proxy_path(profile_pic)
    temp_hash
  end
end
