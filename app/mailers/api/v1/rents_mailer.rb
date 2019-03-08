module Api
  module V1
    class RentsMailer < ApplicationMailer
      def new_rent(rent)
        @rent = rent
        @user = rent.user
        @book = rent.book
        mail to: @user.email
      end
    end
  end
end
