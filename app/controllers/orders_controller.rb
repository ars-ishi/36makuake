class OrdersController < ApplicationController
  def new
    @order = Order.new
    @user = User.find(current_user.id)
    @usersAddresses = @user.send_addresses
    @address = Order.main_address(current_user.id)
    @course = Course.find(course_params[:course_id])
  end

  def create
  end

private
  def course_params
    params.permit(:project_id, :course_id)
  end

  def order_params
  end

  def order_detail_params
  end

  def order_answer_params
  end
end
