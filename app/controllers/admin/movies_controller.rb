class Admin::MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews.all
    #@review = Review.find(params[:id])
  end
end
