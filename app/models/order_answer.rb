class OrderAnswer < ApplicationRecord
  belongs_to :order_detail, optional: true
  belongs_to :course_question
  validates :answer, presence: true
end
