FactoryBot.define do
  factory :user do
    username {Faker::Name.name}
    sequence(:email){Faker::Internet.email}
    password {"anhlam"}
    address {"Hai Duong"}
    phone { "012345678" }

    trait :invalid_email do
      email {Faker::Name.name}
    end

    trait :admin do
      admin {true}
    end

    trait :user do
      admin {false}
    end
  end
end
