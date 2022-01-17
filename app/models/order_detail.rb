class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status: {
    restricting: 0,
    waiting: 1,
    producing: 2,
    preparing: 3
  }

  def detail_price
    price_detail * amount
  end

  def price_detail
    (price_time * 1.1).floor
  end
end
