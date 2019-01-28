class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  delegate :name, :price, :picture, to: :product, prefix: "product", allow_nil: true
  delegate :quantity, to: :product, prefix: :product, allow_nil: true
  delegate :picture, to: :product, prefix: :product, allow_nil: true
  before_destroy :return_quantity_when_refuse
  after_save :update_order_total_price
  
  private
  def return_quantity_when_refuse
    product.update_attribute :quantity, product_quantity + quantity if order.pending? || order.refuse?
  end

  def update_order_total_price
    order.update_attribute :total, (order.total + product_price * quantity.to_f)
    product.update_attribute :quantity, product_quantity - quantity.to_i
  end
end
