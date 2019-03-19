class Book < ApplicationRecord
  validates :genre, :author, :image, :title, :editor, :year, presence: true
  has_many :rents, dependent: :nullify
  scope :long_title, -> { where('length(title) > ?', 25) }
end
