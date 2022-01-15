class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  def order_price
    billing - 800
  end
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum received: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み:4 }

end
