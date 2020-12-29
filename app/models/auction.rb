class Auction < ApplicationRecord
  has_many_attached :images
  has_many :bids, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_amount, numericality: { greater_than: 0 } 

  def has_finished
    # @todo this needs to change if bids force the auction to stay open longer
    # than the end_date
    end_date > Date.now
  end

  def has_started
    start_date > Date.now
  end
end
