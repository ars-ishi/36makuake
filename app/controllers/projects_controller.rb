class ProjectsController < ApplicationController
  def index

    projects = Project.all.includes(:project_images)
    @sliders = []
    sliders = ProjectSlider.limit(5)
    sliders.each do |slider|
      @sliders << slider
    end
    @slider_project = []
    @sliders.each do |slider|
      @slider_project << projects.find(slider.project_id)
    end

    @projects = Project.all
    @pickups =Project.limit(8)
    @new = Project.limit(8).order("created_at DESC")
    @reports = Report.limit(5).includes(project: :user)
    @comments = ProjectComment.limit(5).includes(project: :users)
    @courses = Course.limit(5)

  end

  def new
  end

  def create
  end

  def show
    @project = Project.find(params[:id])
    @orders = Order.where(project_id: params[:id])
    @supporters = []
    @orders.each do |order|
      @supporters << order[:user_id]
    end
    @supporters = @supporters.uniq.length
    @courses = @project.courses
    @comments = @project.project_comments.order("created_at DESC")
    @summary= @project.summary.split(",")

    project_movie_path = ProjectMovie.find_by(project_id: @project.id).movie
    @movie_id = project_movie_path.slice!(32..45)
  end


  def search
    @projects = Project.where('name LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(15).order("created_at DESC")
    @categories = Category.order("id ASC")
  end


end
