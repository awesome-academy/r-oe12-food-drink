class Categoty < ApplicationRecord
  has_many :products, dependent: :destroy
end