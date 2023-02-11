class Admin::MoviesController < ApplicationController
 # ログインしていないと表示できない  
  before_action :authenticate_admin!
  
  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews.all
    #@review = Review.find(params[:id])
  end
end
