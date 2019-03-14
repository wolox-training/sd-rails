def open_library_success_stub
  stub_request(:get, 'https://openlibrary.org/api/books?bibkeys=ISBN:0385472579&format=json&jscmd=data')
    .to_return(
      status: 200,
      body: File.read(Rails.root.join('spec', 'support',
                                      'fixtures', 'open_library_response_success.json')),
      headers: { 'Content-Type': 'application/json' }
    )
end

def open_library_error_stub
  stub_request(:get, 'https://openlibrary.org/api/books?bibkeys=ISBN:xxx&format=json&jscmd=data')
    .to_return(
      status: 404,
      body: '{}',
      headers: { 'Content-Type': 'application/json' }
    )
end
