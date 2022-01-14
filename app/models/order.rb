class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  def order_price
    billing - 800
  end
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum received: { }

end
