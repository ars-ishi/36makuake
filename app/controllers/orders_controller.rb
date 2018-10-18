class OrdersController < ApplicationController
  def new
    @order = Order.new
    @user = User.find(current_user.id)
    @usersAddresses = @user.send_addresses
    @address = Order.main_address(current_user.id)
    @course = Course.find(course_params[:course_id])
  end

  def create

  #以下決済処理
  @amount = 500
  #JSライブラリからトークンを受け取る処理
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )
  #決済処理
  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )
  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
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
