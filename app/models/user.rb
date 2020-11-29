class User < ApplicationRecord
  enum sex: { male: 1, female: 2 }
  has_many :posts, dependent: :destroy
  has_many :comments
  # see more about enum: 
  # https://edgeapi.rubyonrails.org/classes/ActiveRecord/Enum.html
  attr_accessor :password_confirmation
  before_save { self.mail = mail.downcase }
  valid_email_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: Settings.model.user.validates.name.maximum }
  validates :mail, presence: true,
                    length: { maximum: Settings.model.user.validates.mail.maximum },
                    format: { with: valid_email_regex },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: Settings.model.user.validates.password.minimum }, allow_blank: true, confirmation: true
  def authenticate(login_password)
    if login_password == password
      return true
    else
      return false
    end
  end
end
