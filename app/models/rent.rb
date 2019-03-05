class Rent < ApplicationRecord
  validates :init_date, :return_date, presence: true

  belongs_to :user
  belongs_to :book
end
