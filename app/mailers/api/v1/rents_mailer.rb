module Api
  module V1
    class RentsMailer < ApplicationMailer
      def new_rent(rent_id)
        @rent = Rent.find(rent_id)
        @user = @rent.user
        @book = @rent.book
        mail to: @user.email
        mail subject: I18n.t('new_rent_subject')
      end
    end
  end
end
