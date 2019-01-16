class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details, dependent: :destroy
  has_many :ratings, dependent: :destroy
  scope :order_by, -> (order_type = :desc){order created_at: order_type}
  scope :category_by, -> (category){where category_id: category}
end
