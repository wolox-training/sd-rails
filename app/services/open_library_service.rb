class OpenLibraryService
  include HTTParty

  def book(isbn)
    params_url = "bibkeys=ISBN:#{isbn}&format=json&jscmd=data"
    HTTParty.get(base_uri + params_url)
  end

  private

  def base_uri
    'http://openlibrary.org/api/books?'
  end
end
