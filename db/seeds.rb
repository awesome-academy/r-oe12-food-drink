User.create!(username: "Pham Tung Lam", email: "anhlam@gmail.com",
  password: "anhlam", password_confirmation: "anhlam", is_admin: true)
Category.create!(name: "Foods")
Category.create!(name: "Drinks")
Product.create!(name: "banh ngot", describe: "banh nay ngon", quantity: 100, price: 12000, 
  picture: "no_image.jpg", category_id: 1)

5.times do
  name = Faker::Name.name
  describe = "banh nay ngon"
  quantity = 100
  price = 12000
  picture = "no_image.jpg"
  category_id = 1
  Product.create!(name: name, describe: describe, quantity: quantity, price: price, 
    picture: picture, category_id: category_id)
end

Order.create!(user_id: 1)
OrderDetail.create!(order_id: 1, product_id: 1, quantity: 3)
