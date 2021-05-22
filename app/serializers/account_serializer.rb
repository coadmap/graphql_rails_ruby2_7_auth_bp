# frozen_string_literal: true
# AccountSerializer
class AccountSerializer < ActiveModel::Serializer
  attributes :id, :email, :username
end
