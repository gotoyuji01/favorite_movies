class Admin::HomesController < ApplicationController
  def top
    @movies = Movie.all.order(title: :asc).page(params[:page]).per(8) #作品名順に並び替え 1ページに8作品表示
    @genres = Genre.all
  end
  
  def genre_movies
  #ジャンルを先に指定して、ジャンルに基づく作品を拾う(中間テーブル)  
    @genre = Genre.find(params[:id]) 
    @movies = @genre.movies.order(title: :asc).page(params[:page]).per(8) #作品名順に並び替え 1ページに8作品表示
    @genres = Genre.all
  end
  
end
