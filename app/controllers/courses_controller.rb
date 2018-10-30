class CoursesController < ApplicationController
  before_action :set_project, only: [:new, :create]

  def new
    if current_user.admin? || current_user.promoter?
      @course = @project.courses.new
      @course.course_images.new
      course_questions = @course.course_questions.new
      3.times {course_questions.course_question_answers.new}
      render layout: 'account'
    else
      redirect_to root_path, alert: 'アクセスできないページです'
    end
  end

  def create
    if current_user.admin? || current_user.promoter?
      @course = @project.courses.new(courses_params)
      if @course.save
        redirect_to user_promoter_profile_path(current_user, current_user.promoter_profile), notice: 'コースを追加しました。'
      else
        flash.now[:alert] = 'コースを作成できませんでした。入力内容をご確認ください。'
        render 'new'
      end
    else
      redirect_to root_path, alert: 'アクセスできないページです'
    end
  end

  def show
    @course   = Course.find(params[:id])
    @image    = CourseImage.find_by(course_id: @course.id).image
    @questions = CourseQuestion.where(course_id: @course.id, usable: "1")
    render layout: false
  end

  private

  def courses_params
   params.require(:course).permit(
     :name,
     :content,
     :price,
     :due_date,
     :stock,
     :sales_type,
     course_images_attributes: [:image],
     course_questions_attributes: [:content, { course_question_answers_attributes: [:content] } ]
   )
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
