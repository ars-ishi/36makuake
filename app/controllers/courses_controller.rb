class CoursesController < ApplicationController
  def new
  end

  def create
  end

  def show
    @course   = Course.find(params[:id])
    @image    = CourseImage.find(@course.id).image
    @questions = CourseQuestion.where(course_id: @course.id, usable: "1")
    render layout: false
  end
end
