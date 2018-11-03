class Restaurant < ApplicationRecord
  belongs_to :restorer

  validates :restaurant_type, presence: true
  validates :summary, presence: true, length: {maximum: 600}
  validates :address, presence: true
  validates :reduction, presence: true, numericality: {only_integer: true, greater_than: 5}
  validates :price, presence: true, numericality: {only_integer: true, greater_than: 5}
end
