class Report < ApplicationRecord
  belongs_to :project
  has_many   :report_images, dependent: :destroy
  has_many   :report_comments, dependent: :destroy
  has_many   :report_likes, dependent: :destroy
  has_many   :users, through: :report_likes
end
