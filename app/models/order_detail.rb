class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  array = []
  OrderDetail.all.each do |order_detail|
    array << order_detail.amount
  end
  array.sum

  OrderDetail.all.sum(:amount)
end
