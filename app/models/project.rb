class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many   :courses, dependent: :destroy
  has_many   :project_images, dependent: :destroy
  has_many   :project_movies, dependent: :destroy
  has_many   :project_categories, dependent: :destroy
  has_many   :categories, through: :project_categories
  has_many   :project_tags, dependent: :destroy
  has_many   :tags, through: :project_tags
  has_many   :reports, dependent: :destroy
  has_many   :project_comments, dependent: :destroy
  has_many   :project_comment_responses, through: :project_comments
  has_many   :project_likes, dependent: :destroy
  has_many   :users, through: :project_likes
  belongs_to :project_pickup
  belongs_to :project_slider
end
