module Api
  module V1
    class BookSuggestionsController < ApiController
      def create
        suggestion = BookSuggestion.new(suggestion_params)
        if suggestion.save!
          render json: suggestion, status: :created
        else
          render json: { errors: suggestion.erros }, status: :precondition_failed
        end
      end

      private

      def suggestion_params
        params.require(:book_suggestion).permit(:synopsis, :price, :author,
                                                :title, :link, :editor, :year, :user_id)
      end
    end
  end
end
