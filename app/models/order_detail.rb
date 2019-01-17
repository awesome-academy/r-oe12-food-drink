class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  delegate :name, :price, :picture, to: :product, prefix: "product", allow_nil: true
end
