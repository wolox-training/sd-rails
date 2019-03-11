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
  locale: 'es'
)

Book.create(
  genre: 'Horror',
  author: 'some author',
  image: 'some image',
  title: 'some title',
  editor: 'some editor',
  year: '2019'
)

Rent.create(
  user: User.last, 
  book: Book.last, 
  init_date: Time.now, 
  return_date: Time.now
)
