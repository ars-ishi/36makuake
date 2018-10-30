class Order < ApplicationRecord
  belongs_to :user
  has_many   :order_details

  accepts_nested_attributes_for :order_details

  def self.full_name(last, first)
    fullName = last + " " + first
  end
end
