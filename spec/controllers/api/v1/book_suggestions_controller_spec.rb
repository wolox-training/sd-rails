require 'rails_helper'

describe Api::V1::BookSuggestionsController, type: :controller do
  describe 'POST #create' do
    subject(:http_request) { post :create, params: { book_suggestion: book_suggestion } }
    let(:book_suggestion) { attributes_for(:book_suggestion) }

    context 'When creating a valid book suggestion' do
      it 'creates a new book suggestion' do
        expect { http_request }.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with created status' do
        http_request
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid book suggestion' do
      let(:book_suggestion) { attributes_for(:book_suggestion, title: nil) }

      include_examples 'error examples'

      it 'responds with unprocessable_entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'When request params are invalid' do
      let(:book_suggestion) { nil }

      include_examples 'error examples'

      it 'responds with bad_request status' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
