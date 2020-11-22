class User < ApplicationRecord
  enum sex: { male: 1, female: 2 }
  has_many :posts, dependent: :destroy
  has_many :comments
  # see more about enum: 
  # https://edgeapi.rubyonrails.org/classes/ActiveRecord/Enum.html
  attr_accessor :password_confirmation
  before_save { self.mail = mail.downcase }
  validates :name, presence: true, length: { maximum: 50 } #validates(:name, presence: true)
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :mail, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_blank: true, confirmation: true
  def authenticate(login_password)
    if login_password == password
      return true
    else
      return false
    end
  end
end
