class Order < ApplicationRecord
  belongs_to :user
  has_many   :order_details

  accepts_nested_attributes_for :order_details

  def self.main_address(id)
    array = User.find(id).send_addresses.where(main: "1")
    address = {}
    array.each do |ele|
      address = ele
    end
    return address
  end

  def self.full_name(last, first)
    fullName = last + " " + first
  end
end
