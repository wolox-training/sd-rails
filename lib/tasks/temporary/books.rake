namespace :books do
  desc "Truncates book titles longer than 25 chars"
  task truncate_titles: :environment do
    books = Book.long_title

    ActiveRecord::Base.transaction do
      books.each do |book|
        book.update(title: book.title.truncate(25))
      end
    end
  end
end
