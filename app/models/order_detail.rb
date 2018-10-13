class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :course
  has_many   :order_answers
end
