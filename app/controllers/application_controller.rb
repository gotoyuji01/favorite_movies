class ApplicationController < ActionController::Base

# 検索機能
  before_action :set_search

  def set_search
    @search = Movie.ransack(params[:q])
    @search_movies = @search.result.order(title: :asc).page(params[:page]).per(8) #作品名順に並び替え 1ページに8作品表示
  end
  
  
end
