class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :suggests, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :ratings, dependent: :destroy

  scope :order_created_at_desc, -> {order created_at: :desc}

  def current_user? user
    user == self
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first

    unless user
      user = User.create(username: data["name"],
        email: data["email"],
        password: Devise.friendly_token[0,20]
      )
    end
    user
end
end
