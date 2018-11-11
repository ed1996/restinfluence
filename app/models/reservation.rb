class Reservation < ApplicationRecord
  belongs_to :influencer
  belongs_to :restaurant
end
