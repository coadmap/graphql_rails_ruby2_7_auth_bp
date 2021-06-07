# frozen_string_literal: true
module Exceptions
  module Graphql
    # エラーコード
    module ErrorCode
      INTERNAL_SERVER_ERROR = 'INTERNAL_SERVER_ERROR'
      NOT_FOUND = 'NOT_FOUND'
      RECORD_INVALID = 'RECORD_INVALID'
      ARGUMENT_ERROR = 'ARGUMENT_ERROR'
      UNAUTHORIZED_ERROR = 'UNAUTHORIZED_ERROR'
      ACCESS_DENIED = 'ACCESS_DENIED'
    end
  end
end
