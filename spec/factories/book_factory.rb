FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Name.name }
    image { Faker::Internet.url }
    title { Faker::Book.title }
    editor { Faker::Book.publisher }
    year { Faker::Date.between(100.years.ago, Time.zone.today).year }
  end
end
