class Suggest < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: {minimum: Settings.suggest.name.minimum}
  validates :describe, presence: true
  validates :price, presence: true
end
