class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :movies, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  # 会員名が一意であること
  validates :name, uniqueness: true
  
  # メールアドレスが一意であること
  validates :email, uniqueness: true
  
  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@member.com') do |member|
      member.password = SecureRandom.urlsafe_base64
      member.password_confirmation = member.password
      member.name = 'ゲストメンバー'
    end
  end
  
  
end
