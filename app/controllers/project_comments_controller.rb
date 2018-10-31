class ProjectCommentsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @comments = @project.project_comments.order("created_at DESC")
  end

  def create
    @comment = ProjectComment.create(comment_params)
    if @comment.save
      redirect_to project_project_comments_path(@comment.project_id)
    else
      render "create"
  end

end

private

  def comment_params
    params.permit(:project_id, :content, :user_id)
  end
end
