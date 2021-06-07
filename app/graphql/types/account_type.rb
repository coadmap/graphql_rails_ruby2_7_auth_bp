# frozen_string_literal: true
module Types
  # AccountType
  class AccountType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :username, String, null: false
    field :avatar_url, String, null: true
    field :email_verification_status, Enums::AccountEmailVerificationStatusType, null: false

    field :created_at, DateTimeType, null: false
    field :updated_at, DateTimeType, null: false
  end
end
