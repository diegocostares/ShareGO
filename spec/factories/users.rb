# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    bio { Faker::Lorem.paragraph }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end
