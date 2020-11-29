class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  enum typing: { share: 1, ask: 2 }

  def time
    distance_of_time_in_words(self.created_at,Time.now).titleize
  end
  
end
