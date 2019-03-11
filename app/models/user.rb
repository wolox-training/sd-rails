class User < ApplicationRecord
  devise :database_authenticatable, :registerable
  include DeviseTokenAuth::Concerns::User
  has_many :rents, dependent: :nullify
  has_many :book_suggestions, dependent: :nullify
  enum locale: { en: 0, es: 1 }
end
