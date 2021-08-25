class Post < ApplicationRecord
  belongs_to :user
  has_many :comment
  has_many_attached :images
  has_many :likes, dependent: :destroy
  validates :user_id, presence: true
  validates :images, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }
end
