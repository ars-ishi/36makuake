class Course < ApplicationRecord
  belongs_to :project
  has_many   :course_images, dependent: :destroy
  has_many   :course_questions, dependent: :destroy
  has_many   :order_details

  enum sales_type: { open: 1, close: 2, is_store: 3 }

  def update_stock(current_course, count)
    after_payment_stock      = current_course.stock.to_i - count.to_i
    current_course.update!(stock: after_payment_stock)
  end
end
