class Like < ApplicationRecord
  puts 'We are in like active record'
  belongs_to :posts
end
