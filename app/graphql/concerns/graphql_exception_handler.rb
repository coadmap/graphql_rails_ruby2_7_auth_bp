# frozen_string_literal: true
# Graphql用例外対応
module GraphqlExceptionHandler
  extend ActiveSupport::Concern
  include Exceptions::Graphql

  included do
    rescue_from StandardError do |e|
      Rails.logger.fatal e&.full_message
      fail GraphQL::ExecutionError.new(e&.message, extensions: { code: ErrorCode::INTERNAL_SERVER_ERROR })
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      fail GraphQL::ExecutionError.new("NotFound: #{e.message}", extensions: { code: ErrorCode::NOT_FOUND })
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      fail GraphQL::ExecutionError.new("RecordInvalid: #{e.message}", extensions: {
                                         code: ErrorCode::RECORD_INVALID
                                       })
    end

    rescue_from ActionController::ParameterMissing do |e|
      fail GraphQL::ExecutionError.new("ParameterMissing: #{e.message}", extensions: {
                                         code: ErrorCode::ARGUMENT_ERROR
                                       })
    end

    rescue_from JWT::DecodeError do |e|
      fail GraphQL::ExecutionError.new("JWT::DecodeError: #{e&.message}", extensions: {
                                         code: ErrorCode::UNAUTHORIZED_ERROR
                                       })
    end
  end
end
