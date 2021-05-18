# frozen_string_literal: true

module Auth
  module V1
    # 認証コントローラー
    class AuthController < ApplicationController
      skip_before_action :authenticate_account!, except: :sign_out

      def sign_in
        account = Account.find_by(
          email: sign_in_params[:email]
        ).try(:authenticate, sign_in_params[:password])

        return head(401) if account.blank?

        render json: account, serializer: AccountWithTokenSerializer
      end

      def sign_up
        fail Errors::InvalidEmailError if Account.pluck(:email).include?(sign_up_params[:email])

        @account = Account.create!(email: sign_up_params[:email],
                                   password: sign_up_params[:password],
                                   password_confirmation: sign_up_params[:password],
                                   username: sign_up_params[:username])
        AccountMailer.verification_email(@account.id).deliver_later

        render json: @account, status: :created, serializer: AccountWithTokenSerializer
      end

      def sign_out
        current_account.invalidate_jwt!(@current_jwt)
        head 204
      end

      def verify_email
        account = Account.find_by(email_verification_token: params[:token])
        return head 403 if params[:token].blank? || account.blank?

        account.update!(
          email_verification_status: Account::EmailVerificationStatus::VERIFIED,
          email_verification_token: nil
        )

        redirect_to "https://#{ENV.fetch('FRONT_APP_HOST')}"
      end

      private
      def sign_up_params
        params.require(:account).permit(:email, :username, :password)
      end

      def sign_in_params
        params.require(:account).permit(:email, :password)
      end
    end
  end
end
