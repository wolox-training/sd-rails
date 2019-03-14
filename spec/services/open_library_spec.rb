describe OpenLibraryService do
  describe '#book' do
    context 'When open library request is successfull' do
      it 'returns the book info' do
        open_library_success_stub
        fixture = load_fictures_file('open_library_response_success')
        response = OpenLibraryService.new('0385472579').book
        expect(response).equal? fixture
      end
    end

    context 'When library request is unsuccessfull' do
      it 'raises error when book not found' do
        open_library_error_stub
        expect { OpenLibraryService.new('xxx').book }
          .to raise_error(Errors::ExternalRecordNotFoundException)
      end
    end
  end
end
