class Admin::AuctionsController < ApplicationController
  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.images.attach(params[:images])

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

    # @todo figure out how to purge or allow additional images to be uploaded
    # do not replace current images
    @auction.images.attach(params[:images])

    if @auction.update(auction_params)
      flash[:notice] = "This auction was updated successfully"
      redirect_to admin_auctions_path
    else
      render :edit
    end
  end

  def destroy
    @auction = Auction.find(params[:id])
    @auction.destroy

    redirect_to admin_auctions_path
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])

    if @image.purge
      flash[:notice] = "The image was deleted successfully"
    end

    redirect_back fallback_location: request.referer
  end

  private
    def auction_params
      params
        .require(:auction)
        .permit(:name, :description, :start_date, :end_date, :featured, :enabled, :start_amount, images: [])
    end
end
