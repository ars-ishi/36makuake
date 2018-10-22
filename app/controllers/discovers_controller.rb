class DiscoversController < ApplicationController
  def index
    @projects = Project.page(params[:page]).per(15).order("id DESC")
    sideber
  end

  def new
    @projects = active_projects.order("created_at DESC")
    sideber
  end

  def soon
    @projects = active_projects.order("deadline ASC")
    sideber
  end

  def ranking
    @projects = active_projects.order("total_sales DESC")
    sideber
  end

  def pickup
    @projects = active_projects.order("RAND()").limit(15)
    sideber
  end

  def show
    @projects = Project.where("category_id = ?", params[:id]).page(params[:page]).per(15)
    @category = Category.find(params[:id])
    sideber
  end

  private

  def active_projects
    @projects = Project.where("deadline > ?", Time.now).page(params[:page]).per(15)
  end

  def sideber
    @categories = Category.order("id ASC")
  end
end
