class BidsController < ApplicationController
  include ActionView::Helpers::NumberHelper

  before_action :get_auction

  def create
    notice = create_bid
    redirect_to auction_path(@auction), notice: notice
  end

  def destroy
    @bid = @auction.bids.find(params[:id])
    @bid.destroy

    redirect_to auction_path(@auction)
  end

  private

  def create_bid
    @bid = @auction.bids.new(bid_params)
    @bid_amount = bid_params[:value].to_f

    if @bid_amount <= @auction.minimum_bid_amount
      return "Your bid is too low, the minimum bid is #{number_to_currency(@auction.minimum_bid_amount)}."
    end

    if @bid.save
      return 'Bid was sucessfully created.'
    else
      return 'Something went wrong. Your bid was not recorded.'
    end
  end

  def get_auction
    @auction = Auction.find(params[:auction_id])
  end

  def bid_params
    params.require(:bid).except(:inc).permit(:user_id, :value)
  end
end
