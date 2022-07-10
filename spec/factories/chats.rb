FactoryBot.define do
  factory :chat do
    association :publication

    trait :with_messages do
      after(:create) do |chat|
        chat.messages << create_list(:message, 3)
      end
    end
  end
end
