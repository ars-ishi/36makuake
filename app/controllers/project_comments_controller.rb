class ProjectCommentsController < ApplicationController

  def index
  end

  def create
    @comment = ProjectComment.create(comment_params)
  end

end

private

  def comment_params
    params.permit(:project_id, :content, :user_id)
  end
