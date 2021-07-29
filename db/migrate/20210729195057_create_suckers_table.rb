class CreateSuckersTable < ActiveRecord::Migration
  def change
    create_table :suckers do |t|
      t.string "first_name"
      t.string "middle_name"
      t.string "last_name"
      t.string "maiden_name"
      t.string "pseudonym"
      t.string "alias"
      t.string "user_name"
      t.string "password_digest"
      t.string "cell_phone_number"
      t.string "home_phone_number"
      t.string "address_1"
      t.string "address_2"
      t.string "PO_Box"
      t.string "primary_email"
      t.string "secondary_email"
      t.string "spam_email"
      t.string "yearly_income"
      t.string "social_security_number"
      t.string "primary_bank"
      t.string "credit_score"
      t.string "relationship_status"
      t.string "favorite_pet"
      t.string "additional_pet"
      t.string "catch_phrase"
      t.string "political_affiliation"
      t.string "belief_religion"
      t.string "interests"

      t.timestamps null: false
    end
  end
end
