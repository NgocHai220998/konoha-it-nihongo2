class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def new_record?
    Like.find_by(user_id:self.user_id,post_id:self.post_id).nil?
  end
end
