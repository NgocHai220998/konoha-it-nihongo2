class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def time
    distance_of_time_in_words(self.created_at,Time.now).titleize
  end
end
