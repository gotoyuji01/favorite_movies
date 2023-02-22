class Public::HomesController < ApplicationController
  def top
    @movies = Movie.all.order(title: :asc).page(params[:page]).per(8) #作品名順に並び替え 1ページに8作品表示
    @genres = Genre.all
  end
end
