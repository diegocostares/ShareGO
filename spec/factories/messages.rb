FactoryBot.define do
  factory :message do
    association :user
    association :chat
    text { Faker::Lorem.sentence }
    index { chat.messages.count }
  end
end
