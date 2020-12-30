class Bid < ApplicationRecord
  belongs_to :auction, inverse_of: :bids
  validates :value, numericality: { greater_than: 0 }

  INCREMENTS = [1, 5, 10, 20, 50, 100, 125, 175, 200, 250, 300, 350, 400, 450, 500, 600, 700, 800, 900, 1000]
end
