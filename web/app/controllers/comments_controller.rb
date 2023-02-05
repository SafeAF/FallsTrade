class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing
  before_action :set_comment, only: %i[ show edit update destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @listing.comments.new(comment_params.merge(user: current_user))
    @comment.save
    # respond_to do |format|
    #   if @comment.save
    #     #format.turbo_stream
    #     format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
    #     format.json { render :show, status: :created, location: @listing }
    #   else
    #     format.html { redirect_to listing_path(@listing), alert: "Reply could not be created" }
    #   end
    # end
  end

  def destroy
    @comment = @listing.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to listing_path(@listing), notice: "Comment was deleted" }
    end
  end

  def user
   @user = User.find(params[:id])
   @comments = Comment.where(user_id: @user)
end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end
end
