class DiscoversController < ApplicationController
  def index
    @projects = Project.page(params[:page]).per(15).order("id DESC")
  end

  def new
    @projects = active_projects.order("created_at DESC")
  end

  def soon
    @projects = active_projects.order("deadline ASC")
  end

  def ranking
    @projects = Project.page(params[:page]).per(15).order("total_sales DESC")
  end

  def pickup
    @projects = active_projects.order("RAND()").limit(15)
  end

  def categories
    @projects = Project.where("category_id = ?", params[:id]).page(params[:page]).per(15).order("created_at DESC")
    @category = Category.find(params[:id])
  end

  def tags
    @projects = Project.from_tag(params[:id]).page(params[:page]).per(15).order("created_at DESC")
    @tag = Tag.find(params[:id])
  end

  def tags_index
  end

  def location
    @projects = Project.from_location(params[:id]).page(params[:page]).per(15).order("created_at DESC")
  end

  private

  def active_projects
    @projects = Project.where("deadline > ?", Time.now).page(params[:page]).per(15)
  end

end
