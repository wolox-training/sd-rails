class Rent < ApplicationRecord
  validates :init_date, :return_date, presence: true
  belongs_to :user
  belongs_to :book

  scope :expired_return_date, -> { where(arel_table[:return_date].lt(Time.zone.today)) }
end
