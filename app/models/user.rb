class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :suggests, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :ratings, dependent: :destroy

  scope :search, ->(key){where("email LIKE ? OR username LIKE ?", "%#{key}%", "%#{key}%")}
  scope :order_by, -> {order created_at: :desc}

  def current_user? user
    user == self
  end
end
