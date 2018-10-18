class ProjectsController < ApplicationController
  def index

    projects = Project.all.includes(:project_images)
    @slider = []
    sliders = ProjectSlider.limit(5)
    sliders.each do |slider|
      @slider << slider
    end
    @slider_project = []
    @slider.each do |slider|
      @slider_project << projects.find(slider.project_id)
    end

    @projects = Project.all.includes(:project_images)
    @pickups =Project.limit(8).includes(:project_images)
    @new = Project.limit(8).order("created_at DESC")
    @reports = Report.limit(5).includes(project: :user,project: :project_images)
    @comments = ProjectComment.limit(5).includes(project: :user,project: :project_images)
    @courses = Course.limit(5).includes(project: :user,project: :project_images)

  end


  def new
  end

  def create
  end

  def show
  end
end
