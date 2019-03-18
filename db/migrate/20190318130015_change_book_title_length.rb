class ChangeBookTitleLength < ActiveRecord::Migration[5.1]
  def change
    Book.find_each do |book|
      if book.title.length > 25
        book.update(title: book.title.truncate(25))
      end
    end
    change_column :books, :title, :string, :limit => 25
  end
end
