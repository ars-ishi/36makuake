class OrderDetail < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :course
  has_many   :order_answers
end
