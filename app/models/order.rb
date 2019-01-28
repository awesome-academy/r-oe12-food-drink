class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details

  enum status: {pending: 0, accept: 1, refuse: 2}
  delegate :email, to: :user, prefix: "user", allow_nil: true
  delegate :username, to: :user, prefix: "user", allow_nil: true
end
