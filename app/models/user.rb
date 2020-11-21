class User < ApplicationRecord
  enum sex: { male: 1, female: 2 }
  has_many :posts, dependent: :destroy
  has_many :comments
  # see more about enum: 
  # https://edgeapi.rubyonrails.org/classes/ActiveRecord/Enum.html
end
