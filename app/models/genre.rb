class Genre < ApplicationRecord
# 中間テーブル
  has_many :movie_genre_relations
  has_many :movies, through: :movie_genre_relations
  
end
