# frozen_string_literal: true
module Mutations
  # サインインMutation
  class SignInAccount < BaseMutation
    field :account, Types::AccountType, null: false
    field :token, String, null: false

    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(email:, password:)
      account = Account.find_by!(email: email)
      fail Exceptions::UNAUTHORIZED_ERROR unless account.authenticate(password)

      { account: account, token: account.jwt }
    end
  end
end
