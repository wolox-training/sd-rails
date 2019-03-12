class OpenLibraryService
  include HTTParty
  base_uri 'https://openlibrary.org'

  def initialize(isbn)
    @isbn = isbn
    @options = { query: { bibkeys: "ISBN:#{isbn}", format: 'json', jscmd: 'data' } }
  end

  def book
    response = self.class.get('/api/books', @options)
    format(@isbn, response)
  end

  private

  def format(isbn, response)
    response = JSON.parse(response.body)["ISBN:#{isbn}"]
    if response.nil?
      not_found(isbn)
    else
      found_record(isbn, response)
    end
  end

  def not_found(isbn)
    {
      description: 'RECORD_NOT_FOUND',
      message: "Record with isbn #{isbn} was not found.",
      status: 404
    }
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
