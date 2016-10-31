class User < ActiveRecord::Base
  has_one :profile

  attr_accessor :password
  validates_confirmation_of :password

  validates_format_of :email, :with => /@/

  before_create :encrypt_password
  before_create :generate_confirmation_token

  include BCrypt
  validates :email, :presence => true

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(:email => email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def email_activate
    self.confirmation_token = nil
    self.email_confirmed = true
  end

  private

  def generate_confirmation_token
    if self.confirmation_token.blank?
      self.confirmation_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end
