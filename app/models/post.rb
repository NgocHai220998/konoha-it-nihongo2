class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  enum typing: { share: 1, ask: 2 }
end
