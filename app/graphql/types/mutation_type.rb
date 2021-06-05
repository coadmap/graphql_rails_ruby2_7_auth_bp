# frozen_string_literal: true
module Types
  # MutationType
  class MutationType < Types::BaseObject
    field :sign_up_account, mutation: Mutations::SignUpAccount
    field :sign_in_account, mutation: Mutations::SignInAccount
  end
end
