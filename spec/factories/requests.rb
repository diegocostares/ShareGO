require 'faker'

FactoryBot.define do
  factory :request do
    status { 'pending' }
    association :user, factory: :user
    association :publication, factory: :publication
  end
end
