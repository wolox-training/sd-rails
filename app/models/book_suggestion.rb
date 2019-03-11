class BookSuggestion < ApplicationRecord
  validates :author, :link, :title, :editor, :year, presence: true
  belongs_to :user
end
