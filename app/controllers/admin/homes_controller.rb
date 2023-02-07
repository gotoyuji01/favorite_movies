class Admin::HomesController < ApplicationController
  def top
    @movies = Movie.all
    @genres = Genre.all
  end
  
  def genre_movies
  #ジャンルを先に指定して、ジャンルに基づく作品を拾う(中間テーブル)  
    @genre = Genre.find(params[:id]) 
    @movies = @genre.movies
    @genres = Genre.all
  end
  
end
