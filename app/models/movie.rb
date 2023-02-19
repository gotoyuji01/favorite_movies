class Movie < ApplicationRecord
  belongs_to :member
  
# 中間テーブル  
  has_many :movie_genre_relations
  has_many :genres, through: :movie_genre_relations
  
  has_many :reviews, dependent: :destroy
# fields_forに必要（複数テーブルに保存する）  
  accepts_nested_attributes_for :reviews, allow_destroy: true
  
# 作品名が重複しない
  validates :title, uniqueness: true
# 作品名が選択されている
  validates :title, presence: true
# ジャンルが選択されている  
  validates :genre_ids, presence: true
# アソシエーションを組んであるモデルに対してのバリデーション  
  validates_associated :reviews
  
# ransack v4.0.0から検索を許可するカラムの追加が必要  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "member_id", "title", "updated_at"]
  end
  
end
