FactoryBot.define do
  factory :review do
    score { rand(1..5) }
    publication { create(:publication) }
    user { create(:user) }
  end
end
