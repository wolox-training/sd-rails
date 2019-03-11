module Api
  module V1
    class BooksController < ApiController
      before_action :authenticate_user!

      def index
        render_paginated Book.all, each_serializer: BookSerializer
      end

      def show
        render json: book
      end

      private

      def book
        @book ||= Book.find(params.require(:id))
      end
    end
  end
end
