class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :books, dependent: :destroy
  attachment :profile_image, destroy: false
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  def favorited_by?(user)
		favorites.where(user_id: user_id).exists?
  end
  

  validates :name, uniqueness: true, length: {minimum: 2, maximum: 20}
  validates :introduction, length: {maximum: 50}
end
