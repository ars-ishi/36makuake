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
    @pickups =Project.order("RAND()").limit(8)
    @new = Project.limit(8).order("created_at DESC")
    @reports = Report.limit(5).includes(project: :user)
    @comments = ProjectComment.limit(5).includes(project: :users)
    @courses = Course.limit(5)

  end

  def new
    if current_user.admin? || current_user.promoter?
      @project = current_user.projects.new
      @project.project_tags.new
      @project.project_movies.new
      4.times {@project.project_images.new}
      courses = @project.courses.new
      courses.course_images.new
      course_questions = courses.course_questions.new
      3.times {course_questions.course_question_answers.new}
      render layout: 'account'
    else
      redirect_to root_path, alert: 'アクセスできないページです'
    end
  end

  def create
    if current_user.admin? || current_user.promoter?
      @project = current_user.projects.new(projects_params)
      if @project.save
        redirect_to user_promoter_profile_path(current_user, current_user.promoter_profile), notice: 'プロジェクトを作成しました。'
      else
        flash.now[:alert] = 'プロジェクトを作成できませんでした。入力内容をご確認ください。'
        render 'new'
      end
    else
      redirect_to root_path, alert: 'アクセスできないページです'
    end
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

    if ProjectMovie.find_by(project_id: @project.id).present?
      project_movie_path = ProjectMovie.find_by(project_id: @project.id).movie
      @movie_id = project_movie_path.slice!(32..45)
    end
  end


  def search
    @projects = Project.where('name LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(15).order("created_at DESC")
    @categories = Category.order("id ASC")
  end

  private
  def projects_params
    params.require(:project).permit(
      :name,
      :summary,
      :content,
      :support_type,
      :deadline,
      :target_sales,
      :total_sales,
      :thumbnail,
      :category_id,
      tag_ids: [],
      project_images_attributes: [:image],
      project_movies_attributes: [:movie],
      courses_attributes: [
        :name,
        :content,
        :price,
        :due_date,
        :stock,
        :sales_type,
        { course_images_attributes: [:image] },
        { course_questions_attributes: [:content, { course_question_answers_attributes: [:content] } ] }
      ]
    )
  end

end
