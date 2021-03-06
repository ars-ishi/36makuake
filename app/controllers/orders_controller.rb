class OrdersController < ApplicationController
  before_action :set_project, only: [:create]
  before_action :set_course,  only: [:create]
  before_action :set_user, only: [:index, :new]
  before_action :course_from_show, only: [:new]

  def index
    @address = set_user.send_addresses.find(params[:id])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @order = Order.new(new_order_params)
    @order.order_details.build
    @answer = OrderAnswer.new(new_order_answer_question_params)
    @user = set_user
    @usersAddresses = @user.send_addresses
    @address = @usersAddresses.find_by(main: "1")
    @fullName = Order.full_name(@address.last_name, @address.first_name)
    @course = course_from_show
    @shippingTime = Time.zone.now
    render layout: false
  end

  def create
    ##達成率演算
    @project = Project.find(order_params[:project_id])
    @achievement = @project.achievement_f
    ##支援金合計の演算処理&更新処理
    set_project.update_total_sales(set_project, order_params[:payment_price])
    @comment = ProjectComment.new(comment_params)
    ApplicationRecord.transaction do
      ##オーダーを保存する
      @order = Order.new(order_params)
      @order.save!
      if order_answer_params[:question].present?
        OrderAnswer.create!(order_answer_params)
      end
      ##在庫を変更する演算処理&更新処理
      unless set_course.update_stock(set_course, order_params[:order_details_attributes].values[0]['order_quantity'])
        raise ActiveRecord::Rollback
      end
      ##決済処理
      @amount = order_params[:payment_price]
      ##JSライブラリからトークンを受け取りStripeへデータを保存する処理
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
      ##Stripe決済処理
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'jpy'
      )
    render layout: false
    end
    rescue Stripe::CardError => e
    flash[:error] = e.message
    ActiveRecord::Rollback
  end

private
  def new_order_params
    params.permit(:project_id, :user_id)
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

  def comment_params
    params.permit(:project_id, :user_id, :content)
  end

  def course_from_show
    course_from_show = Course.find(params[:course_id])
  end

  def set_project
    set_project = Project.find(order_params[:project_id])
  end

  def set_course
    set_course = Course.find(order_params[:order_details_attributes].values[0]['course_id'])
  end

  def set_user
    set_user = User.find(current_user.id)
  end
end
