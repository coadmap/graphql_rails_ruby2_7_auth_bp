# frozen_string_literal: true
module JWT
  # JWTヘルパー
  module Helper
    module_function

    def encode(payload, alg = 'HS256', typ = 'JWT', **opts)
      JWT.encode(payload, Rails.application.credentials.secret_key_base, alg, typ: typ, **opts)
    end

    def decode(token, verify: true, **opts)
      JWT.decode(token, Rails.application.credentials.secret_key_base, verify, **opts)
    end
  end
end
