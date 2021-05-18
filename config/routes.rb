# frozen_string_literal: true
Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'

  namespace :auth do
    namespace :v1 do
      post :sign_in, to: 'auth#sign_in'
      post :sign_up, to: 'auth#sign_up'
      delete :sign_out, to: 'auth#sign_out'
      get :verify_email, to: 'auth#verify_email'
    end
  end
end
