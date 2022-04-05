class Book
  def initialize(title, authors, highlights)
    @title = title
    @authors = authors
    @highlights = highlights
  end

  def show
    {
      title: @title,
      authors: @authors,
      highlights: @highlights
    }
  end
end
