# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Auth::V1::AuthController, type: :request do
  let_it_be(:account) { create(:account, email_verification_token: SecureRandom.uuid) }

  describe 'POST /auth/v1/sign_in' do
    subject(:request) { post auth_v1_sign_in_path, params: params }

    context '正しいパラメーター' do
      let_it_be(:params) do
        { account: { email: account.email, password: 'password' } }
      end

      it 'サインインできること' do
        expect { request }.to change { Jti.count }.by(+1)
        expect(response).to have_http_status(:ok)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body.keys).to contain_exactly('account', 'token')
      end
    end

    context '正しくないパラメーター' do
      let_it_be(:params) do
        { account: { email: account.email, password: 'invalid_password' } }
      end

      it 'サインインに失敗すること' do
        expect { request }.not_to change(Jti, :count)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'POST /auth/v1/sign_up' do
    subject(:request) { post auth_v1_sign_up_path, params: params }
    let_it_be(:params) do
      { account: { username: 'ヤマダくん',
                   email: 'sample@example.com',
                   password: 'password' } }
    end

    it 'サインアップできること' do
      expect { request }.to change(Account, :count).by(+1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /auth/v1/sign_out' do
    subject(:request) { delete auth_v1_sign_out_path, headers: headers }

    context '正しいjwt' do
      let_it_be(:headers) { { Authorization: "Bearer #{account.jwt}" } }

      it 'サインアウトできること' do
        request
        expect(response).to have_http_status(:no_content)
        expect(Jti.count).to eq 0
      end
    end

    context '正しくないjwt' do
      let_it_be(:headers) { {} }

      it 'サインアウトに失敗すること' do
        request
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET /auth/v1/verify_email' do
    subject(:request) { get auth_v1_verify_email_path(token: account.email_verification_token) }

    it 'メールアドレスが認証されること' do
      request
      expect(account.reload.email_verification_status).to eq 'verified'
    end
  end
end
