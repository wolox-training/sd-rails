FactoryBot.define do
  factory :book do
    genre { 'Horror' }
    author { 'John Doe' }
    image { 'Some image' }
    title { 'Horror book' }
    editor { 'Some editor' }
    year { '2019' }
  end
end
