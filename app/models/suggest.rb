class Suggest < ApplicationRecord
  belongs_to :user

  enum status: {pending: 0, accept: 1, refuse: 2}
  validates :name, presence: true, length: {minimum: Settings.suggest.name.minimum}
  validates :describe, presence: true
  validates :price, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: Settings.suggest.price.minimum,
    less_than_or_equal_to: Settings.suggest.price.maximum

  scope :order_created_at_desc, -> {order created_at: :desc}

  delegate :username, to: :user, prefix: :user
end
