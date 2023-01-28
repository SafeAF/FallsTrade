class CommentsController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_listing

  def create
    @comment = @listing.comments.new(comment_params.merge(user: current_user))
    respond_to do |format|
      if @comment.save
        format.turbo_stream
      else
        format.html { redirect_to listing_path(@listing), alert: "Reply could not be created" }
      end
    end
  end

  def destroy
    @comment = @listing.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to listing_path(@listing), notice: "Comment was deleted" }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
