class ProjectLikesController < ApplicationController
  before_action :set_variables, except: :index

  def index
    likes = ProjectLike.where(user_id: current_user.id)
    @projects = []
    likes.each do |like|
      @projects << Project.find(like.project_id)
    end
  end

  def like
    project_like = current_user.project_likes.new(project_id: @project.id)
    project_like.save
  end

  def unlike
    project_like = current_user.project_likes.find_by(project_id: @project.id)
    project_like.destroy
  end

private

  def set_variables
    @project = Project.find(params[:project_id])
    @id_name = "#like-link-#{@project.id}"
    @id_heart = "#heart-#{@project.id}"
    @id_heart_word = "#heart-word-#{@project.id}"
  end
end
