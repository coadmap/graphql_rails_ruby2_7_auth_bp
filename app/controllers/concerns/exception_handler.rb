# frozen_string_literal: true

# 例外対応
# rubocop:disable Metrics/BlockLength
module ExceptionHandler
  extend ActiveSupport::Concern
  included do
    rescue_from StandardError do |e|
      Rails.logger.fatal e.full_message
      json_response({ errors: [{ description: e.message, status: 500 }] }, :internal_server_error)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ errors: [{ description: e.message, status: 404 }] }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ errors: [{ description: e.message, status: 422 }] }, :unprocessable_entity)
    end

    rescue_from ActionController::ParameterMissing do |e|
      json_response({ errors: [{ description: e.message, status: 422 }] }, :unprocessable_entity)
    end

    rescue_from JWT::DecodeError do
      json_response({ errors: [{ description: 'Unauthorized', status: 401 }] }, :unauthorized)
    end

    rescue_from Errors::InvalidOTPError do |e|
      json_response({ errors: [{ description: e.message, status: 403 }] }, :forbidden)
    end

    def json_response(obj, status = :ok)
      render json: obj, status: status
    end
  end
end
# rubocop:enable Metrics/BlockLength
