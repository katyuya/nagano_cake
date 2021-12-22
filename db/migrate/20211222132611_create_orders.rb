class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      t.string :shipping_zip_code
      t.string :shipping_address
      t.string :delivery_name
      t.integer :postage
      t.integer :billing
      t.integer :payment_method
      t.integer :received
      
      t.timestamps
    end
  end
end
