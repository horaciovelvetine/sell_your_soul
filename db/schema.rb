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

ActiveRecord::Schema.define(version: 2021_07_30_193036) do

  create_table "corporations", force: :cascade do |t|
    t.string "name"
    t.float "payout_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spam", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "maiden_name"
    t.string "pseudonym"
    t.string "alias"
    t.string "username"
    t.string "password_digest"
    t.string "cell_phone_number"
    t.string "home_phone_number"
    t.string "address_one"
    t.string "address_two"
    t.string "P_O_Box"
    t.string "primary_email"
    t.string "secondary_email"
    t.string "spam_email"
    t.string "yearly_income"
    t.string "social_security_number"
    t.string "primary_bank"
    t.string "credit_score"
    t.string "relationship_status"
    t.string "employment_status"
    t.string "employer"
    t.string "catch_phrase"
    t.string "political_affiliation"
    t.string "belief_religion"
    t.string "interests"
    t.text "additional_details_one"
    t.text "additional_details_two"
    t.float "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "suckers", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "maiden_name"
    t.string "pseudonym"
    t.string "alias"
    t.string "username"
    t.string "password_digest"
    t.string "cell_phone_number"
    t.string "home_phone_number"
    t.string "address_one"
    t.string "address_two"
    t.string "P_O_Box"
    t.string "primary_email"
    t.string "secondary_email"
    t.string "spam_email"
    t.string "yearly_income"
    t.string "social_security_number"
    t.string "primary_bank"
    t.string "credit_score"
    t.string "relationship_status"
    t.string "employment_status"
    t.string "employer"
    t.string "catch_phrase"
    t.string "political_affiliation"
    t.string "belief_religion"
    t.string "interests"
    t.text "additional_details_one"
    t.text "additional_details_two"
    t.float "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.float "amount"
    t.string "transaction_id"
  end

end
