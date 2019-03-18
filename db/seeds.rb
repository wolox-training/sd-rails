User.create(
  email: 'test@wolox.com.ar',
  password: '123123123',
  password_confirmation: '123123123',
  first_name: 'Test',
  last_name: 'TestLastName'
)

User.create(
  email: 'test@wolox.com.es',
  password: '123123123',
  password_confirmation: '123123123',
  first_name: 'Test',
  last_name: 'TestLastName',
  locale: 1
)

Rent.create(
  user: User.last, 
  book: Book.last, 
  init_date: Time.now, 
  return_date: Time.now
)


50000.times do
  Book.create(
    genre: Faker::Book.genre,
    author: Faker::Name.name,
    image: Faker::Internet.url,
    title: Faker::Book.title,
    editor: Faker::Book.publisher,
    year: Faker::Date.between(100.years.ago, Time.zone.today).year
  )
end
