FactoryBot.define do
  factory :suggest do
    name { "MyString" }
    describe { "MyString" }
    price { 10000 }
    picture { "MyString" }
    status { 0 }

    after(:build) do |suggest|
      user = FactoryBot.create :user

      suggest.user_id = user.id
    end
  end
end
