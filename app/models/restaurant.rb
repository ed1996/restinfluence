class Restaurant < ApplicationRecord
  belongs_to :restorer
  has_many :photos
  has_many :menu
  has_many :reservations

  validates :restaurant_type, presence: true
  validates :listing_name, presence: true
  validates :summary, presence: true, length: {maximum: 600}
  validates :address, presence: true
  validates :reduction, presence: true, numericality: {only_integer: true, greater_than: 5}
  validates :price, presence: true, numericality: {only_integer: true, greater_than: 5}

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
