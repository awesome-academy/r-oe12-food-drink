FactoryBot.define do
  factory :product do
    name { "MyString" }
    describe { "MyString" }
    price { 1.5 }
    price_new { 1.5 }
    status { "MyString" }
    category { nil }
  end
end
