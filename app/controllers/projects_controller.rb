class ProjectsController < ApplicationController
  def index
    projects = Project.all
    @slider = []
    sliders = ProjectSlider.all
    sliders.each do |slider|
      @slider << slider
    end
    @slider_project = []
    @slider.each do |slider|
      @slider_project << projects.find(slider.project_id)
    end


    @projects = Project.all
    @pickups =Project.all
    @new = Project.order("created_at DESC")
    @reports = Report.limit(5).includes(project: :user,project: :project_images)
    @comments = ProjectComment.limit(5)
    @courses = Course.limit(5)
  end


  def new
  end

  def create
  end

  def show
  end
end
