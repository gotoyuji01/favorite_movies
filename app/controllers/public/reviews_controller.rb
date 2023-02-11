class Public::ReviewsController < ApplicationController
 # ログインしていないと表示できない  
  before_action :authenticate_member!
  
  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    # レビュー登録成功のif文
    if @review.save
       redirect_to movie_path(@movie.id)
    else
       render :new
    end

  end
  

  def show
    @review = Review.find(params[:id])
    @comments = @review.comments.all
  end
  
   private
  
  def review_params
    params.require(:review).permit(:review_text, :point, :member_id, :movie_id)
  end
  
end
