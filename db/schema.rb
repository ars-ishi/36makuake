# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181012102559) do

  create_table "promoter_profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.string "business_entity", null: false
    t.string "corporate_name", null: false
    t.string "staff_name", null: false
    t.string "position"
    t.string "email", default: "", null: false
    t.string "phone_number", null: false
    t.string "postal_code", null: false
    t.string "location", null: false
    t.string "representative", null: false
    t.string "website"
    t.string "category", null: false
    t.string "questionnaire", null: false
    t.string "progress", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_promoter_profiles_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 1, null: false
    t.string "name", null: false
    t.string "image"
    t.string "url"
    t.string "location"
    t.integer "birth_year"
    t.integer "birth_month"
    t.integer "birth_day"
    t.boolean "birth_isvalid", default: false
    t.integer "gender"
    t.boolean "gender_isvalid", default: false
    t.text "introduction"
    t.boolean "admission", default: true
    t.boolean "news_isvalid", default: false
    t.boolean "report_isvalid", default: false
    t.boolean "tag_isvalid", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "promoter_profiles", "users"
end
