class Notification < ApplicationRecord
  belongs_to :post
  enum state: { unread: 1, readed: 2 }
  enum typing: { like: 1, comment: 2 }
end
