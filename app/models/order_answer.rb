class OrderAnswer < ApplicationRecord
  belongs_to :order_detail, optional: true
  belongs_to :course_question
end
