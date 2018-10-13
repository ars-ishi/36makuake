class OrderAnswer < ApplicationRecord
  belongs_to :order_detail
  belongs_to :course_question
end
