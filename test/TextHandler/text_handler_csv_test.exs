defmodule TextHandlerCsvTest do
  use ExUnit.Case
  doctest TextHandler.Csv

  setup_all do
    {:ok, header: "\uFEFF\"As notas do Kindle para:\",,,\n\"Book Title\",,,\n\"de author1\",,,\n\"Visualização instantânea gratuita do Kindle:\",,,\n\"https://a.co/aGb4vrv\",,,\n----------------------------------------------,,,\n,,,\n"}
  end

  test "extracts the title from the header", state do
    assert TextHandler.Csv.get_title(state[:header]) == "Book Title"
  end

  test "extracts a list of authors", state do
    authors = TextHandler.Csv.get_authors(state[:header])

    assert is_list(authors)
    assert authors == ["author1"]
  end
end
