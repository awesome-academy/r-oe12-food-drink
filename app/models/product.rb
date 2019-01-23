class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details, dependent: :destroy
  has_many :ratings, dependent: :destroy
  scope :order_by, -> (order_type = :desc){order created_at: order_type}
  scope :category_by, -> (category){where category_id: category}

  validates :name, presence: true, length: {minimum: Settings.admin.products.name.minimum}
  validates :describe, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: Settings.product.minimum,
    less_than_or_equal_to: Settings.product.maximum
  mount_uploader :picture, PictureUploader
  delegate :name, to: :category, prefix: true

end
