defmodule TextHandlerMarkdownTest do
  use ExUnit.Case
  doctest TextHandler.Markdown

  # test "converts the header"
  test "converts an row array into a markdown topic" do
    row1 =  ~w(Destaque 2 highlight)
    row2 =  ~w(Nota 2 note)

    assert TextHandler.Markdown.row_to_topic(row1) == "- (H) 2: highlight"
    assert TextHandler.Markdown.row_to_topic(row2) == "- (N) 2: note"
  end
end
