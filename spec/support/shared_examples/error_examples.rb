shared_examples 'error examples' do
  it 'returns error messages' do
    http_request
    expect(response.body['message']).to be_present
  end

  it "doesn't create a new book suggestion" do
    expect { http_request }.to change { BookSuggestion.count }.by(0)
  end
end
