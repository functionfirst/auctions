class BidsController < ApplicationController
  def create
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bid.create(bid_params)
    redirect_to auction_path(@auction)
  end

  def destroy
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bid.find(params[:id])
    @bid.destroy

    redirect_to auction_path(@auction)
  end

  private
  def bid_params
    params.require(:bid).permit(:user_id, :value)
  end
end
