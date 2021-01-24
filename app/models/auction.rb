class Auction < ApplicationRecord
  has_many_attached :images
  has_many :bids, -> { order('value desc').limit(10) }, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_amount, numericality: { greater_than: 0 } 

  def has_finished
    # @todo this needs to change if bids force the auction to stay open longer
    # than the end_date
    DateTime.now > end_date
  end

  def is_live
    # @todo this needs to change if bids force the auction to stay open longer
    # than the end_date
    DateTime.now > start_date && DateTime.now < end_date
  end

  def has_started
    DateTime.now > start_date
  end

  def minimum_bid_amount
    if bids.length > 0 then
      bids.first.value + 1
    else
      start_amount
    end
  end
end
