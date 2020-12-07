class Comment < ApplicationRecord
  validates :content, presence: true,
            length: {
              maximum: Settings.model.comment.validates.content.maximum
            }
  belongs_to :post
  belongs_to :user

  def time
    distance_of_time_in_words(self.created_at,Time.now).titleize
  end
end
