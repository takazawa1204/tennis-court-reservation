class User < ApplicationRecord
  has_secure_password validations: true
  after_initialize :set_default_values

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  has_many :reservations, dependent: :destroy

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA256.hexdigest(token.to_s)
  end

  private

  def set_default_values
    self.level ||= 1
  end
end
