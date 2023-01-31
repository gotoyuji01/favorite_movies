class Public::MoviesController < ApplicationController
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
    @genre = Genre.all
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews.all
    #@review = @movie.reviews.find(params[:id])
  end
  
  private
  
  def movie_params
    params.require(:movie).permit(:title, genre_ids: [ ], reviews_attributes: [:review_text, :point, :member_id, :_destroy, :id]).merge(member_id: current_member.id)
  end
  
end
