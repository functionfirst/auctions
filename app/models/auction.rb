class Auction < ApplicationRecord
  has_many :bids, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_amount, numericality: { greater_than: 0 } 
end
