class User < ApplicationRecord
  devise :database_authenticatable, :registerable
  include DeviseTokenAuth::Concerns::User
  has_many :rents, dependent: :nullify
  enum locale: [ :en, :es ]
end
