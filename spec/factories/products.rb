# :name, :price, :vegetarian, :category, :description
FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    price { Faker::Number.between(from: 0.0, to: 100.0).round(2) }
    vegetarian { false }
    category { "second_course" }
    description { Faker::Lorem.paragraph }
  end
end
