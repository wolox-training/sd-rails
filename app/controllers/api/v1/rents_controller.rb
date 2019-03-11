module Api
  module V1
    class RentsController < ApiController
      before_action :authenticate_user!
      before_action :set_locale, only: [:create]

      def create
        rent = Rent.new(rent_params)
        authorize rent
        if rent.save!
          Api::V1::RentsMailer.new_rent(rent.id).deliver_later
          render json: rent, status: :created
        else
          render json: { errors: rent.erros }, status: :precondition_failed
        end
      end

      def index
        render_paginated Rent.where(user: current_user), each_serializer: RentSerializer
      end

      private

      def rent_params
        params.require(:rent).permit(:init_date, :return_date, :user_id, :book_id)
      end
    end
  end
end
