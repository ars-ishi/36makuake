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

  enum support_type: { all_in: 1, all_or_nothing: 2 }

  def bar
    total_sales*100 / target_sales
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

  def update_total_sales(project, total_sales)
    project.update(total_sales: total_sales)
  end
end
