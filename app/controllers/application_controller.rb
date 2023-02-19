class ApplicationController < ActionController::Base

# 検索機能
  before_action :set_search

  def set_search
    @search = Movie.ransack(params[:q])
    @search_movies = @search.result.page(params[:page])
  end
  
  
end
