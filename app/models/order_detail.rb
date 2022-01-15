class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status: { 着手不可: 0, 製作中: 1, 製作完了: 2 }

  def detail_price
    price_detail * amount
  end

  def price_detail
    (price_time * 1.1).floor
  end
end
