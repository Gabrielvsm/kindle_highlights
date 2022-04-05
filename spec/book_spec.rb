require_relative '../src/book'

RSpec.describe 'The book class' do
  context 'when creating a book' do
    it 'saves the title, authors and highlights of the book' do
      highlights = [
        {
          position: '4324',
          highlight: 'highlight text1',
          note: ''
        }
      ]
      book = Book.new('Lord of The Rings', ['J R R Tolkien'], highlights)

      expect(book.show).to eq({
                                title: 'Lord of The Rings',
                                authors: [
                                  'J R R Tolkien'
                                ],
                                highlights: highlights
                              })
    end
  end
end
