class Review < ApplicationRecord
  belongs_to :member
  belongs_to :movie
  has_many :comments, dependent: :destroy
  
  validates :point, presence: true
  validates :review_text, presence: true
  
end
