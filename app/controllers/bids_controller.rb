class BidsController < ApplicationController
  before_action :get_auction

  def create
    @bid = @auction.bids.create(bid_params)
    redirect_to auction_path(@auction)
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
