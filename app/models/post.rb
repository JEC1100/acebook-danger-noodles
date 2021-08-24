class Post < ApplicationRecord
  has_many_attached :images
  validates :images, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :user_id, presence: true
end
