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
  # 会員名が選択されている
  validates :name, presence: true
   # メールアドレスが一意であること
  validates :email, uniqueness: true
  # メールアドレスが選択されている
  validates :email, presence: true
  
  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@member.com') do |member|
      member.password = SecureRandom.urlsafe_base64
      member.password_confirmation = member.password
      member.name = 'ゲストメンバー'
    end
  end
  
  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  
end
