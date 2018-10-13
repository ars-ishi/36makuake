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

ActiveRecord::Schema.define(version: 20181013021613) do

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

  create_table "order_answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "order_detail_id", null: false
    t.bigint "course_question_id", null: false
    t.string "question"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_question_id"], name: "index_order_answers_on_course_question_id"
    t.index ["order_detail_id"], name: "index_order_answers_on_order_detail_id"
  end

  create_table "order_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "order_id", null: false
    t.bigint "course_id", null: false
    t.integer "order_quantity", null: false
    t.integer "unit_price", null: false
    t.string "shipping_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_order_details_on_course_id"
    t.index ["order_id"], name: "index_order_details_on_order_id"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.integer "payment_price"
    t.text "send_address"
    t.integer "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_orders_on_project_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
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

  create_table "project_comment_responses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "project_comment_id"
    t.bigint "user_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_comment_id"], name: "index_project_comment_responses_on_project_comment_id"
    t.index ["user_id"], name: "index_project_comment_responses_on_user_id"
  end

  create_table "project_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_comments_on_project_id"
    t.index ["user_id"], name: "index_project_comments_on_user_id"
  end

  create_table "project_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "project_id", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_images_on_project_id"
  end

  create_table "project_likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_likes_on_project_id"
    t.index ["user_id"], name: "index_project_likes_on_user_id"
  end

  create_table "project_movies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "project_id", null: false
    t.string "movie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_movies_on_project_id"
  end

  create_table "project_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "project_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_tags_on_project_id"
    t.index ["tag_id"], name: "index_project_tags_on_tag_id"
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

  create_table "reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "project_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_reports_on_project_id"
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

  create_table "tag_likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_tag_likes_on_tag_id"
    t.index ["user_id"], name: "index_tag_likes_on_user_id"
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  add_foreign_key "order_answers", "course_questions"
  add_foreign_key "order_answers", "order_details"
  add_foreign_key "order_details", "courses"
  add_foreign_key "order_details", "orders"
  add_foreign_key "orders", "projects"
  add_foreign_key "orders", "users"
  add_foreign_key "payment_methods", "users"
  add_foreign_key "project_comment_responses", "project_comments"
  add_foreign_key "project_comment_responses", "users"
  add_foreign_key "project_comments", "projects"
  add_foreign_key "project_comments", "users"
  add_foreign_key "project_images", "projects"
  add_foreign_key "project_likes", "projects"
  add_foreign_key "project_likes", "users"
  add_foreign_key "project_movies", "projects"
  add_foreign_key "project_tags", "projects"
  add_foreign_key "project_tags", "tags"
  add_foreign_key "projects", "categories"
  add_foreign_key "projects", "users"
  add_foreign_key "promoter_profiles", "users"
  add_foreign_key "reports", "projects"
  add_foreign_key "send_addresses", "users"
  add_foreign_key "tag_likes", "tags"
  add_foreign_key "tag_likes", "users"
end
