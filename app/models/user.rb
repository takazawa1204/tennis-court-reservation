class User < ApplicationRecord
  has_secure_password validations: true
  after_initialize :set_default_values
  # Use this if you wanna set default values only when creating a new record.
  #after_initialize :set_default_values, if: :new_record?

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

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
