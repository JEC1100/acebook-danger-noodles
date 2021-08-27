class User < ApplicationRecord
  has_many :comments
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar
  validates :avatar, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/heic'], size_range: 1..5.megabytes }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
