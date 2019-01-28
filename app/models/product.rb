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
  scope :filter_by_alphabet, ->(alpha){where("name LIKE ?", "#{alpha}%") if alpha.present?}
  scope :filter_by_name, ->(name){where("name LIKE ?", "%#{name}%") if name.present?}
  scope :filter_by_category, ->(category_id){where(category_id: category_id) if category_id.present?}
  scope :filter_by_min_price, ->(min_price){where("price >= ?", min_price) if min_price.present?}
  scope :filter_by_max_price, ->(max_price){where("price <= ?", max_price) if max_price.present?}

  def self.filter_product params
    result = Product.all
    result = result.filter_by_alphabet params[:alpha] if params[:alpha].present?
    result = result.filter_by_name params[:name] if params[:name].present?
    result = result.filter_by_category params[:category_id] if params[:category_id].present?
    result = result.filter_by_min_price params[:min_price] if params[:min_price].present?
    result = result.filter_by_max_price params[:max_price] if params[:max_price].present?
    result
  end
end
