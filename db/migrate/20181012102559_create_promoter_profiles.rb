class CreatePromoterProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :promoter_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :business_entity, null: false
      t.string :corporate_name, null: false
      t.string :staff_name, null: false
      t.string :position
      t.string :email, null: false, default: ""
      t.string :phone_number, null: false
      t.string :postal_code, null: false
      t.string :location, null: false
      t.string :representative, null: false
      t.string :website
      t.string :category, null: false
      t.string :questionnaire, null: false
      t.string :progress, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
