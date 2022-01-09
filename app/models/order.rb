class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum address_name:[:"ご自身の住所", :"登録済みの住所から選択", :"新しいお届け先"]
  enum payment_method: { credit_card: 0, transfer: 1 }
end
