class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :review
  
  validates :comment_text, presence: true
  
end
