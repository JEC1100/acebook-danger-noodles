class Comment < ApplicationRecord
  puts 'We are in comment active record'
  belongs_to :post
  belongs_to :user
end
