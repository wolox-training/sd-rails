module Api
  module V1
    class RentsController < ApiController
      before_action :authenticate_user!

      def create
        rent = Rent.create(rent_params)
        render json: rent
      end

      def index
        render json: Rent.all, each_serializer: RentSerializer
      end

      private

      def rent_params
        params.permit(:init_date, :return_date, :user_id, :book_id)
      end
    end
  end
end
