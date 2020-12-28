class Admin::AuctionsController < ApplicationController
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
    @auction.image.attach(params[:image])

    if @auction.save
      flash[:notice] = "The auction was created successfully"
      redirect_to [:admin, @auction]
    else
      render :new
    end
  end

  def edit
    @auction = Auction.find(params[:id])
  end

  def update
    @auction = Auction.find(params[:id])
    @auction.image.attach(params[:image])

    if @auction.update(auction_params)
      flash[:notice] = "This auction was updated successfully"
      redirect_to [:admin, @auction]
    else
      render :edit
    end
  end

  def destroy
    @auction = Auction.find(params[:id])

    @auction.destroy

    redirect_to admin_auctions_path
  end

  private
    def auction_params
      params
        .require(:auction)
        .permit(:name, :description, :start_date, :end_date, :featured, :enabled, :start_amount, :image)
    end
end
