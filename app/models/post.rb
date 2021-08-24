class Post < ApplicationRecord
  has_many_attached :images
  validates :images, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }
  has_many :likes, dependent: :destroy
end
