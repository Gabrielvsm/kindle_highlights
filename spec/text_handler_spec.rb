require 'csv'
require_relative '../src/modules/text_handler/file_text'

RSpec.describe 'The handler of file texts' do
  context 'when extracting information from the csv header' do
    before do
      @header = <<~HEADER
        "As notas do Kindle para:",,,
        "book",,,
        "de author1, author2",,,
      HEADER
    end

    it 'gets the title out of a header' do
      expect(TextHandler::FileText.get_title(@header)).to eq('book')
    end

    it 'gets the authors' do
      expect(TextHandler::FileText.get_authors(@header)).to eq(%w[author1 author2])
    end

    it 'gets the author, when there is only one' do
      header = @header.dup
      header.slice! ', author2'

      expect(TextHandler::FileText.get_authors(header)).to eq(['author1'])
    end
  end

  context 'when extracting the content of a csv row' do
    file_content = <<~CONTENT
      "As notas do Kindle para:",,,
      "book",,,
      "de author",,,
      "Visualização instantânea gratuita do Kindle:",,,
      "https://a.co/link",,,
      ----------------------------------------------,,,
      ,,,
      "Tipo de anotação","Posição","Com estrelas?","Anotação"
      "Destaque (Amarelo)","Posição 78","","highlight1"
      "Destaque (Amarelo)","Posição 90","","highlight2"
      "Nota","Posição 90","","note1"
    CONTENT
    before { @file = File.write('./file.csv', file_content) }
    after(:each) { File.delete('./file.csv') }

    it 'identifies if the row contains a highlight or a note' do
      row = CSV.parse('"Destaque (Amarelo)","Posição 78","","highlight1"')[0]
      row2 = CSV.parse('"Nota","Posição 78","","note1"')[0]

      expect(TextHandler::FileText.get_content(row)).to include(:highlight)
      expect(TextHandler::FileText.get_content(row2)).to include(:note)
    end

    it 'returns the position as an integer' do
      row = CSV.parse('"Destaque (Amarelo)","Posição 78","","highlight1"')[0]

      expect(TextHandler::FileText.get_content(row)[:position]).to eq(78)
    end

    it 'returns the correct note/highlight' do
      row = CSV.parse('"Destaque (Amarelo)","Posição 78","","highlight1"')[0]

      expect(TextHandler::FileText.get_content(row)[:highlight]).to eq('highlight1')
    end
  end
end
