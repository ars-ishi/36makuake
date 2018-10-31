class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many   :courses, dependent: :destroy
  has_many   :project_images, dependent: :destroy
  has_many   :project_movies, dependent: :destroy
  has_many   :project_tags, dependent: :destroy
  has_many   :tags, through: :project_tags
  has_many   :reports, dependent: :destroy
  has_many   :project_comments, dependent: :destroy
  has_many   :project_comment_responses, through: :project_comments
  has_many   :project_likes, dependent: :destroy
  has_many   :users, through: :project_likes
  has_one    :project_pickup, dependent: :destroy
  has_one    :project_slider, dependent: :destroy

  mount_uploader :thumbnail, ProjectMainImageUploader

  enum support_type: { all_in: 1, all_or_nothing: 2 }

  accepts_nested_attributes_for :project_images, reject_if: :reject_project_images
  accepts_nested_attributes_for :project_movies, reject_if: :reject_project_movies
  accepts_nested_attributes_for :courses, reject_if: :reject_courses
  accepts_nested_attributes_for :project_tags, reject_if: :reject_project_tags

  def reject_project_images(attributed)
    attributed['image'].blank?
  end

  def reject_project_movies(attributed)
    attributed['movie'].blank?
  end

  def reject_courses(attributed)
    attributed['content'].blank?
  end

  def reject_project_tags(attributed)
    attributed['tag_id'].blank?
  end


  def achievement
    total_sales*100 / target_sales
  end

  def achievement_f
    (total_sales*100 / target_sales.to_f).round(1)
  end

  def new_project
    year = Time.now.strftime("%Y").to_i - created_at.strftime("%Y").to_i
    days = Time.now.strftime("%j").to_i - created_at.strftime("%j").to_i
    if year > 0
      days = days + created_at.strftime("%j").to_i
    else
      return days
    end
  end

  def time_limit
     years = deadline.strftime("%Y").to_i - Time.now.strftime("%Y").to_i
     days = deadline.strftime("%j").to_i - Time.now.strftime("%j").to_i
     hour = deadline.strftime("%H").to_i - Time.now.strftime("%H").to_i
     minute = deadline.strftime("%M").to_i - Time.now.strftime("%M").to_i
    if years > 0
      days = days + Time.now.strftime("%j").to_i
      return "#{days} 日"
    elsif
      days > 1
      return "#{days} 日"
    elsif  hour > 0 && days == 0
      return "#{hour} 時間"
    elsif minute > 0 && days == 0 && hour == 0
      return "#{minute-1} 分"
    else
      return "終了"
    end
  end

  def update_total_sales(project, order_sales)
    before_payment_total_sales = project.total_sales
    after_payment_total_sales  = before_payment_total_sales.to_i + order_sales.to_i
    project.update(total_sales: after_payment_total_sales)
  end
end
