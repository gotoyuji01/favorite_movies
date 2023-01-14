class Movie < ApplicationRecord
  belongs_to :member
  belongs_to :genre
  has_many :reviews, dependent: :destroy
end
