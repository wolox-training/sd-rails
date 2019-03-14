require 'rails_helper'

describe Api::V1::OpenLibraryRequestsController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #search' do
    context 'Looks for an existing book' do
      before do
        allow_any_instance_of(OpenLibraryService).to receive(:book)
          .and_return(JSON.parse(load_fictures_file('open_library_response_success')))
        get :search, params: { isbn: '0385472579' }
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end

      it 'responds with correct json structure' do
        expected = load_fictures_file('open_library_response_success')
        expect(response.body) =~ expected
      end
    end
  end
end
