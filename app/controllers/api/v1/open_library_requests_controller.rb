module Api
  module V1
    class OpenLibraryRequestsController < ApiController
      before_action :authenticate_user!

      def search
        render json: OpenLibraryService.new(search_params).book
      end

      private

      def search_params
        params.require(:isbn)
      end
    end
  end
end
