class User < ApplicationRecord
  enum sex: { male: 1, female: 2 }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # see more about enum: 
  # https://edgeapi.rubyonrails.org/classes/ActiveRecord/Enum.html
  attr_accessor :password_confirmation, :reset_token
  before_save { self.mail = mail.downcase }
  validates :name, presence: true, length: { maximum: Settings.model.validates.name.maximum }
  validates :mail, presence: true,
    length: { maximum: Settings.model.validates.mail.maximum },
    format: { with: Settings.model.validates.mail.valid_email_regex },
    uniqueness: { case_sensitive: false }
  validates :password, presence: true, 
    length: { minimum: Settings.model.validates.password.minimum },
    allow_blank: true, confirmation: true
    
  def authenticate(login_password)
    if login_password == password
      return true
    else
      return false
    end
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ?
    BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end 

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

   # Returns true if a password reset has expired.
  def password_reset_expired? 
    reset_sent_at < 2.hours.ago
  end
end
