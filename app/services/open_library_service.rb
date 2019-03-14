class OpenLibraryService
  include HTTParty
  base_uri 'https://openlibrary.org'

  def initialize(isbn)
    @isbn = isbn
    @options = { query: { bibkeys: "ISBN:#{isbn}", format: 'json', jscmd: 'data' } }
  end

  def book
    response = self.class.get('/api/books', @options)
    format_ol_response(@isbn, response)
  end

  private

  def format_ol_response(isbn, response)
    response = JSON.parse(response.body)["ISBN:#{isbn}"]
    raise Errors::ExternalRecordNotFoundException, 'external record not found' if response.nil?

    found_record(isbn, response)
  end

  def found_record(isbn, response)
    {
      isbn: isbn,
      title: response['title'],
      subtitle: response['subtitle'],
      number_of_pages: response['number_of_pages'],
      authors: response['authors']
    }
  end
end
