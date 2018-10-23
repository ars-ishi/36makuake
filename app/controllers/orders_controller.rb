class OrdersController < ApplicationController
  def new
    @order = Order.new(new_order_params)
    @order.order_details.build
    @answer = OrderAnswer.new(new_order_answer_question_params)
    @user = User.find(current_user.id)
    @usersAddresses = @user.send_addresses
    @address = Order.main_address(current_user.id)
    @fullName = Order.full_name(@address.last_name, @address.first_name)
    @course = Course.find_by(new_course_params.values)
    @shippingTime = Time.zone.now
    render layout: false
  end

  def create
    @order = Order.new(order_params)
    @order.save
    OrderAnswer.create(order_answer_params)

    #以下決済処理
    @amount = order_params[:payment_price]
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
      :currency    => 'jpy'
    )
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

private
  def new_order_params
    params.permit(:project_id, :user_id)
  end

  def new_course_params
    params.permit(:course_id)
  end

  def new_order_answer_question_params
    params.permit(:question, :answer, :course_question_id)
  end

  def order_params
    params.require(:order).permit(
      :project_id,
      :payment,
      :payment_price,
      :send_address,
      order_details_attributes: [:id, :order_quantity, :shipping_date, :unit_price, :course_id]
    ).merge(user_id: params[:user_id])
  end

  def order_answer_params
    params.require(:order).permit(
      :course_question_id,
      :answer,
      :question
      ).merge(order_detail_id: @order.order_details[0].id)
  end
end
