class ProjectCommentsController < ApplicationController

  def index
  end

  def create
    @comment = ProjectComment.create
  end

end

private

  def comment_params
    params.permit(:project_id, :content, :user_id)
  end
