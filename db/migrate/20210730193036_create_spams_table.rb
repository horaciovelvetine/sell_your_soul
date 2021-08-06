class CreateSpamsTable < ActiveRecord::Migration[6.1]
  def change
        create_table :spams do |t|
      ##NAMES
      t.string "first_name"
      t.string "middle_name"
      t.string "last_name"
      t.string "maiden_name"
      t.string "pseudonym"
      t.string "alias"
      t.string "username"
      
      ##PASS
      t.string "password_digest"
      
      #PHONES
      t.string "cell_phone_number"
      t.string "home_phone_number"
      
      #ADDRESS
      t.string "address_one"
      t.string "address_two"
      t.string "p_o_box"
      
      #EMAILS
      t.string "primary_email"
      t.string "secondary_email"
      t.string "spam_email"
      
      #TWO PERSONAL
      t.string "yearly_income"
      t.string "social_security_number"
      t.string "primary_bank"
      t.string "credit_score"
      
      #BANK RECOVERY 
      t.string "relationship_status"
      t.string "employment_status"
      t.string "employer"
      t.string "catch_phrase"
      
      #JUST IN CASE THEY FEEL STRONGLY
      t.string "political_affiliation"
      t.string "belief_religion"
      t.string "interests"

      #IN CASE WE MISSED IT
      t.text "additional_details_one"
      t.text "additional_details_two"
      
      #BEHIND THE SCENES
      t.float "balance"

      t.timestamps null: false
    end
  end
end
