# frozen_string_literal: true
# アカウント
class Account < ApplicationRecord
  include JWT::Authenticatable

  module EmailVerificationStatus
    UNSPECIFIED = 'unspecified'
    REQUESTED = 'requested'
    VERIFIED = 'verified'
  end

  has_secure_password

  # Enum
  enum email_verification_status: { unspecified: 0, requested: 1, verified: 2 }, _prefix: true

  # Associations
  has_one_attached :avatar

  # Validations
  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
  validates :password, length: { minimum: 8 }, if: -> { password.present? }

  # Methods
  def avatar_url
    url_for(avatar)
  end

  def hogehoge
    nil
  end
end
