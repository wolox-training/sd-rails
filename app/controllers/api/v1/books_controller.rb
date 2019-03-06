module Api
  module V1
    class BooksController < ApiController
      before_action :authenticate_user!

      def index
        render_paginated Book.all, each_serializer: BooksListSerializer
      end

      def show
        render json: Book.find(params[:id]), each_serializer: BookSerializer
      end
    end
  end
end
