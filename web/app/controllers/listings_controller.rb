class ListingsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :require_permission, only: [:edit, :update] #:destroy
  # GET /listings or /listings.json
  def index
      @listings = Listing.all.order(created_at: :desc)
  end

  # GET /listings/1 or /listings/1.json
  def show
    @listing = Listing.find(params[:id])
    @comment = Comment.new
    @comments = @listing.comments.order(created_at: :desc)
    @listing.update(views: @listing.views + 1)
    
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    if current_user.is_administrator || current_user.is_moderator
      Listing.find(params[:id]).destroy
    
    else
      @listing = current_user.listings.find(params[:id])
      @listing.destroy
    end


    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  ## hack to enable users posts to be displayed
  def user
    @user = User.find(params[:id])
    @listings = Listing.where(user_id: @user)
  end


  private
  def require_permission
    if Listing.find(params[:id]).user != current_user || !current_user.is_moderator || !current_user.is_moderator
      redirect_to listings_path
    end
  end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :category, :description, :location, :price, :image,  pictures: [] )
    end
end
