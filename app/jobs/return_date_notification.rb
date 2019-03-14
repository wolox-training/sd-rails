require 'sidekiq-scheduler'

class ReturnDateNotification
  include Sidekiq::Worker

  def perform
    rent_ids = Rent.expired_return_date.pluck(:id)
    send_notification(rent_ids)
  end

  private

  def send_notification(rent_ids)
    rent_ids.each do |rent_id|
      Api::V1::RentsMailer.notify_expired_rent(rent_id).deliver_later
    end
  end
end
