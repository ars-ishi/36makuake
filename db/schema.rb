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

ActiveRecord::Schema.define(version: 20181012113434) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "course_id", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_images_on_course_id"
  end

  create_table "course_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "course_id", null: false
    t.string "content"
    t.boolean "usable", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_questions_on_course_id"
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "project_id", null: false
    t.string "name", null: false
    t.text "content"
    t.integer "price", null: false
    t.string "due_date"
    t.integer "stock", null: false
    t.integer "sales_type", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_courses_on_project_id"
  end

  create_table "payment_methods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.boolean "credit_card", default: false
    t.boolean "convenience", default: false
    t.boolean "bank", default: false
    t.boolean "net_bank", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payment_methods_on_user_id"
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.string "name", null: false
    t.text "summary"
    t.text "content", null: false
    t.integer "support_type", default: 1, null: false
    t.time "deadline", null: false
    t.integer "target_sales", default: 1, null: false
    t.integer "total_sales", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

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

  create_table "send_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.boolean "main", default: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_ruby", null: false
    t.string "first_name_ruby", null: false
    t.integer "gender"
    t.string "industry"
    t.integer "birth_year"
    t.string "phone_number", null: false
    t.string "postal_code", null: false
    t.string "prefecture", null: false
    t.string "municipality", null: false
    t.string "house_number", null: false
    t.string "building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_send_addresses_on_user_id"
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

  add_foreign_key "course_images", "courses"
  add_foreign_key "course_questions", "courses"
  add_foreign_key "courses", "projects"
  add_foreign_key "payment_methods", "users"
  add_foreign_key "projects", "categories"
  add_foreign_key "projects", "users"
  add_foreign_key "promoter_profiles", "users"
  add_foreign_key "send_addresses", "users"
end
