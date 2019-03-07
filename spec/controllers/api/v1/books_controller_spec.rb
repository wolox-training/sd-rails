require 'rails_helper'
require 'factories/book_factory'
require 'factories/user_factory'
require 'shared_contexts/authenticated_user.rb'

RSpec.describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all books' do
      let!(:books) { create_list(:book, 3) }

      before do
        get :index, params: { id: user.id }
      end

      it 'responses with the books list json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, serializer: Api::V1::BooksListSerializer
        ).to_json

        expect(response.body) =~ expected
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a specific book' do
      let!(:book) { create(:book) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responses with the book json' do
        expect(response.body) =~ Api::V1::BookSerializer.new(book).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
