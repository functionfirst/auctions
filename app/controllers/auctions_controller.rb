class AuctionsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.images.attach(params[:images])

    if @auction.save
      flash[:notice] = "This auction was saved successfully"
      redirect_to @auction
    else
      render :new
    end
  end

  def edit
    @auction = Auction.find(params[:id])
  end

  def update
    @auction = Auction.find(params[:id])
    @auction.images.attach(params[:images])

    if @auction.update(auction_params)
      redirect_to @auction
    else
      render :edit
    end
  end

  private
    def auction_params
      params.require(:auction).permit(:name, :description, :start_date, :end_date, :start_amount, images: [])
    end
end
