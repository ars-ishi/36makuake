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
  end


  def search
    @projects =  Project.all
  end
end
