Dir[Rails.root.join('spec', 'factories', '*.rb')].each { |file| require file }

50000.times do
  FactoryBot.create :book
end

10.times do
  FactoryBot.create :user
end

10.times do
  FactoryBot.create :book_suggestion
end
