FactoryBot.define do
  factory :book_suggestion do
    author { Faker::Book.author }
    synopsis { Faker::Lorem.sentence }
    link { Faker::Internet.url }
    price { Faker::Commerce.price }
    title { Faker::Book.title }
    editor { Faker::Book.publisher }
    year { Faker::Date.between(100.years.ago, Time.zone.today).year }
  end
end
