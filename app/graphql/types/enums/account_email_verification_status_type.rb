# frozen_string_literal: true
module Types
  module Enums
    # アカウントのメール確認状態
    class AccountEmailVerificationStatusType < Types::BaseEnum
      value 'UNSPECIFIED', value: Account::EmailVerificationStatus::UNSPECIFIED
      value 'REQUESTED', value: Account::EmailVerificationStatus::REQUESTED
      value 'VERIFIED', value: Account::EmailVerificationStatus::VERIFIED
    end
  end
end
