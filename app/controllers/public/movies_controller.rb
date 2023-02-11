class Public::MoviesController < ApplicationController
 # ログインしていないと表示できない  
  before_action :authenticate_member!, except: [:genre_movies]
  
  def new
    @movie = Movie.new
    @review = @movie.reviews.new
  end
  
  def create
    @movie = Movie.new(movie_params)
    # 作品登録成功のif文
    if @movie.save
       redirect_to movie_path(@movie.id)
    else
       render :new
    end
    
  end

  def index
    @movies = Movie.all
    @genres = Genre.all
  end

  def genre_movies
  #ジャンルを先に指定して、ジャンルに基づく作品を拾う(中間テーブル)  
    @genre = Genre.find(params[:id]) 
    @movies = @genre.movies
    @genres = Genre.all
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews.all
  end
  
  private
  
  def movie_params
    params.require(:movie).permit(:title, :genre_id, genre_ids: [ ], reviews_attributes: [:review_text, :point, :member_id, :_destroy, :id]).merge(member_id: current_member.id)
  end
  
end
