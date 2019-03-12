RSpec.shared_examples 'error examples' do
  before do
    http_request
  end

  it 'returns error messages' do
    expect(response.body['message']).to be_present
  end

  it "doesn't create a new book suggestion" do
    expect { http_request }.to change { BookSuggestion.count }.by(0)
  end
end
