defmodule TextHandlerMarkdownTest do
  use ExUnit.Case
  doctest TextHandler.Markdown

  test "constructs the header of the markdown" do
    raw_header = {"Book Title", ["author1", "author 2"]}
    expected_header = "# Book Title\nAuthors: #author1 #author_2\n---"

    assert TextHandler.Markdown.markdown_header(raw_header) == expected_header
  end

  test "converts an row array into a markdown topic" do
    row1 =  ~w(Destaque 2 highlight)
    row2 =  ~w(Nota 2 note)

    assert TextHandler.Markdown.row_to_topic(row1) == "- (H) 2: highlight"
    assert TextHandler.Markdown.row_to_topic(row2) == "- (N) 2: note"
  end
end
