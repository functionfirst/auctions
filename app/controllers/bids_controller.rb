class BidsController < ApplicationController
  include ActionView::Helpers::NumberHelper

  before_action :get_auction

  def create
    @current_bid = @auction.bids.first
    
    # Check if this is the highest bid
    if (@current_bid.value < bid_params[:value].to_f)
      @bid = @auction.bids.create(bid_params)

      if @bid.save
        notice = 'Bid was successfully created.'
      else
        redirect_to auction_path(@auction), notice: 'Something went wrong when saving your bid.'
        notice = 'Something went wrong when saving your bid.'
      end
    else
      highest_bid_value = number_to_currency(@current_bid.value)
      notice = "Your bid is too low, the highest bid is currently #{highest_bid_value}"
    end

    redirect_to auction_path(@auction), notice: notice
  end

  def destroy
    @bid = @auction.bids.find(params[:id])
    @bid.destroy

    redirect_to auction_path(@auction)
  end

  private

  def get_auction
    @auction = Auction.find(params[:auction_id])
  end

  def bid_params
    params.require(:bid).except(:inc).permit(:user_id, :value)
  end
end
