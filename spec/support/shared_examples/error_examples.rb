RSpec.shared_examples 'error examples' do
  it 'returns error messages' do
    expect(response.body['message']).to be_present
  end

  it 'responds with unprocessable_entity status' do
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
