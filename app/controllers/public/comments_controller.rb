class Public::CommentsController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
    @comment = Comment.new
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    # レビュー登録成功のif文
    if @comment.save
       redirect_to movie_review_path(@movie.id,@review.id)
    else
       render :new
    end

  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment_text, :member_id, :review_id)
  end
  
  
end
