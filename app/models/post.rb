class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :likes, dependent: :destroy
  enum typing: { share: 1, ask: 2 }
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: Settings.model.post.validates.content.maximum }
  validate :image_size
  
  def time
    distance_of_time_in_words(self.created_at,Time.now).titleize
  end
  def get_option_typing
    return {share: 1, ask: 2}
  end
  private

  # Validates the size of an uploaded picture.
  def image_size
    if image.size > Settings.model.post.validates.image_size.maximum.megabytes
      errors.add(:image, "should be less than 5MB")
    end
  end
end
