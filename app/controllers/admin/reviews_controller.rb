class Admin::ReviewsController < ApplicationController
 # ログインしていないと表示できない  
  before_action :authenticate_admin!
  
  def show
    @review = Review.find(params[:id])
    @comments = @review.comments.all
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy!
    redirect_to admin_movie_path(@review.movie_id)
  end
  
   private
  
  def review_params
    params.require(:review).permit(:review_text, :point, :member_id, :movie_id)
  end
  
  
end
