require 'csv'
require_relative '../src/modules/file_handler/files'
require_relative '../src/modules/file_handler/csv'

RSpec.describe 'The file handler' do
  context 'when caling the header extractor' do
    it 'extracts text from the file' do
      File.write('./file.csv', 'some text here and there')

      expect(FileHandler::Files.get_header('./file.csv')).to eq('some text here and there')

      File.delete('./file.csv')
    end

    # The important informations of the header (book title and authors)
    # are located whithin the first 3 lines
    it 'extracts only the 3 first lines of the file' do
      File.write('./file.csv', "line1\nline2\nline3\nline4")

      expect(FileHandler::Files.get_header('./file.csv')).to eq("line1\nline2\nline3\n")

      File.delete('./file.csv')
    end
  end
end

RSpec.describe 'The CSV handler' do
end
