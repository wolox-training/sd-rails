require 'rails_helper'

RSpec.describe Api::V1::BookSuggestionsController, type: :controller do
  describe 'POST #create' do
    subject { post :create, params: { book_suggestion: book_suggestion } }
    let!(:book_suggestion) { attributes_for(:book_suggestion) }

    context 'When creating a valid book suggestion' do
      it 'creates a new book suggestion' do
        expect { subject }.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with created status' do
        post :create, params: { book_suggestion: book_suggestion }
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid book suggestion' do
      let!(:book_suggestion) { attributes_for(:book_suggestion, title: nil) }

      before do
        post :create, params: { book_suggestion: book_suggestion }
      end

      it "doesn't create a new book suggestion" do
        expect { subject }.to change { BookSuggestion.count }.by(0)
      end

      include_examples 'error examples'
    end
  end
end
