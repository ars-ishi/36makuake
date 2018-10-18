# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
## ruby 2.3.1

* Database creation
<!-- * System dependencies

* Configuration

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->

# 36makuake

## users table

|Column|Type|Options|
|------|----|-------|
|role|integer|default: 1, null: false, enum role: { 0:'admin', 1:'supporter', 2:'promoter' }|
|name|string|index: true|
|image|string|
|email|string|null: false, unique: true|
|password|string|null: false|
|url|string|
|location|string|
|birth_year|integer|
|birth_month|integer|
|birth_day|integer|
|birth_isvalid|boolean|default: false|
|gender|integer|enum gender: { 1:'男', 2:'女' }|
|gender_isvalid|boolean|default: false|
|introduction|text|
|admission|boolean|default: true|
|news_isvalid|boolean|default: false|
|report_isvalid|boolean|default: false|
|tag_isvalid|boolean|default: false|

### association
- has_one  :promoter_profile, dependent: :destroy, class_name: PromoterProfile
- has_many :send_addresses, dependent: :destroy, class_name: SendAddress
- has_one  :payment_method
- has_many :project_likes, dependent: :destroy
- has_many :projects, through: :project_likes
- has_many :direct_messages, dependent: :destroy
- has_many :projects, through: :direct_messages
- has_many :orders, dependent: :destroy
- has_many :report_likes, dependent: :destroy
- has_many :report, through: :report_likes


## promoter_profiles table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|business_entity|string|null: false|
|corporate_name|string|null: false|
|staff_name|string|null: false|
|position|string||
|email|string|null: false, default: ""|
|phone_number|string|null: false|
|postal_code|string|null: false|
|location|string|null: false|
|representative|string|null: false|
|website|string||
|category|string|null: false|
|questionnaire|string|null: false|
|progress|string|null: false|
|content|text|null: false|

### association
- belongs_to :user


## send_addresses table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|main|boolean|default: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_ruby|string|null: false|
|first_name_ruby|string|null: false|
|gender|integer||
|industry|string||
|birth_year|integer||
|phone_number|string|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|municipality|string|null: false|
|house_number|string|null: false|
|building|string||

### association
- belongs_to :user


## payment_methods table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|credit_card|boolean|default: false|
|convenience|boolean|default: false|
|bank|boolean|default: false|
|net_bank|boolean|default: false|

### association
- belongs_to :user


## projects table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|name|string|null: false|
|summary|text||
|content|text|null: false|
|support_type|integer|null: false, default: 1, enum support_type: { 1:'all_in', 2:'all_or_nothing' }|
|deadline|time|null: false|
|target_sales|integer|default:1, null: false|
|total_sales|integer|default:0, null: false|
|thumbnail|string|

### association
- belongs_to :user
- belongs_to :category
- has_many   :courses, dependent: :destroy
- has_many   :project_images, dependent: :destroy
- has_many   :project_movies, dependent: :destroy
- has_many   :project_categories, dependent: :destroy
- has_many   :categories, through: :project_categories
- has_many   :project_tags, dependent: :destroy
- has_many   :tags, through: :project_tags
- has_many   :reports, dependent: :destroy
- has_many   :project_comments, dependent: :destroy
- has_many   :project_comment_responses, through: :project_comments
- has_many   :project_likes, dependent: :destroy
- has_many   :users, through: :project_likes
- has_one    :project_pickup, dependent: :destroy, class_name: ProjectPickup
- has_one    :project_slider, dependent: :destroy, class_name: ProjectSlider


## courses table

|Column|Type|Options|
|------|----|-------|
|project_id|references|null: false, foreign_key: true|
|name|string|null: false|
|content|text||
|price|integer|null: false|
|due_date|string||
|stock|integer|null: false|
|sales_type|integer|default:1, enum sales_type: { 1:'受付中', 2:'終了', 3:'商品化' }|

### association
- belongs_to :project
- has_many   :course_images, dependent: :destroy
- has_many   :course_questions, dependent: :destroy
- has_many   :order_details


## course_images table

|Column|Type|Options|
|------|----|-------|
|course_id|references|null: false, foreign_key: true|
|image|string||

### association
- belongs_to :course


## course_questions table

|Column|Type|Options|
|------|----|-------|
|course_id|references|null: false, foreign_key: true|
|content|string||
|usable|boolean|default: true|

### association
- belongs_to :course
- has_many   :course_question_answers, dependent: :destroy


## orders table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|project_id|references|null: false, foreign_key: true|
|payment_price|integer||
|send_address|text||
|payment|integer||


### association
- belongs_to :user
- has_many   :order_details


## order_details table

|Column|Type|Options|
|------|----|-------|
|order_id|references|null: false, foreign_key: true|
|course_id|references|null: false, foreign_key: true|
|order_quantity|integer|null: false|
|unit_price|integer|null: false|
|shipping_date|string||

### association
- belongs_to :order
- belongs_to :course
- has_many   :order_answers


## order_answers table

|Column|Type|Options|
|------|----|-------|
|order_detail_id|references|null: false, foreign_key: true|
|course_question_id|references|null: false, foreign_key: true|
|question|string||
|answer|string||

### association
- belongs_to :order_detail
- belongs_to :course_question


## project_images table

|Column|Type|Options|
|------|----|-------|
|project_id|references|null: false, foreign_key: true|
|image|string||

### association
- belongs_to :project


## project_movies table

|Column|Type|Options|
|------|----|-------|
|project_id|references|null: false, foreign_key: true|
|movie|string||

### association
- belongs_to :project


## project_likes table

|Column|Type|Options|
|------|----|-------|
|project_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### association
- belongs_to :project
- belongs_to :user


## categories table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### association
- has_many   :projects


## tags table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### association
- has_many   :project_tags, dependent: :destroy
- has_many   :projects, through: :project_tags


## project_tags table

|Column|Type|Options|
|------|----|-------|
|project_id|references|foreign_key: true|
|tag_id|references|foreign_key: true|

### association
- belongs_to :project
- belongs_to :tag


## tag_likes table

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|tag_id|references|foreign_key: true|

### association
- belongs_to :user
- belongs_to :tag


## project_comments table

|Column|Type|Options|
|------|----|-------|
|project_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|content|string||

### association
- belongs_to :user
- belongs_to :project
- has_many   :project_comment_responses, dependent: :destroy

## project_comment_responses table

|Column|Type|Options|
|------|----|-------|
|project_comment_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|content|string||

### association
- belongs_to :project_comment


## reports table

|Column|Type|Options|
|------|----|-------|
|project_id|references|foreign_key: true|
|title|string||
|content|text||

### association
- belongs_to :project
- has_many   :report_images, dependent: :destroy
- has_many   :report_comments, dependent: :destroy
- has_many   :report_likes, dependent: :destroy
- has_many   :users, through: :report_likes


## report_images table

|Column|Type|Options|
|------|----|-------|
|report_id|references|foreign_key: true|
|image|string||

### association
- belongs_to :report


## report_comments table

|Column|Type|Options|
|------|----|-------|
|report_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|content|string||

### association
- belongs_to :report
- belongs_to :user


## report_likes table

|Column|Type|Options|
|------|----|-------|
|report_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### association
- belongs_to :report
- belongs_to :user


## direct_messages table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|project_id|references|null: false, foreign_key: true|
|content|text|null: false|

### association
- belongs_to :user
- belongs_to :project


## project_pickups table

|Column|Type|Options|
|------|----|-------|
|project_id|references|foreign_key: true|

### association
- belongs_to :projects


## project_sliders table

|Column|Type|Options|
|------|----|-------|
|project_id|references|foreign_key: true|

### association
- belongs_to :projects


## informations table

|Column|Type|Options|
|------|----|-------|
|title|string||
|content|text||


## course_question_answers table

|Column|Type|Options|
|------|----|-------|
|course_question_id|references|foreign_key: true|
|content|text||

### association
- belongs_to :course_question
