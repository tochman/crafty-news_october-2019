FactoryBot.define do
  factory :article do
    title { "MyString" }
    content { "MyString" }
    association :author, factory: :user
  end
end
