# frozen_string_literal: true

# AccountMailer
class AccountMailer < ApplicationMailer
  def verification_email(account_id)
    @account = Account.find(account_id)
    @account.update!(email_verification_token: SecureRandom.uuid)

    mail(to: @account.email, subject: '[TickNote] メールアドレス確認のお願い')
  end
end
