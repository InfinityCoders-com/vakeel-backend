# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_27_183835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "role_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "salutation"
    t.string "middle_name"
    t.text "address_line_1"
    t.text "address_line_2"
    t.string "city"
    t.string "state"
    t.string "country", default: "India"
    t.integer "pincode"
    t.string "secondary_phone"
    t.text "academic_degrees", default: [], array: true
    t.string "experience"
    t.string "practicing"
    t.text "security_question"
    t.text "encrypted_security_answer"
    t.text "encrypted_security_answer_iv"
  end

end
