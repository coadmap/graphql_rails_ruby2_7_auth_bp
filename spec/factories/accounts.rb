# frozen_string_literal: true
FactoryBot.define do
  factory :account do
    sequence(:email) { |n| "sample_#{n}@example.com" }
    password { 'password' }
    username { 'サンプルユーザー' }
  end
end
