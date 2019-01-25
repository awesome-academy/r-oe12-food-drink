FactoryBot.define do
  factory :product do
    name { "MyString" }
    describe { "MyString" }
    quantity { 100 }
    price { 12000 }
    price_new { 1.5 }


    after(:build) do |product|
      category = FactoryBot.create :category

      product.category_id = category.id
    end
  end
end
