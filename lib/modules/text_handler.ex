defmodule TextHandler do
  def get_title(header) do
    [_ | [title | _]] = Regex.run(~r/para:\",,,\n\"(.*)\",,,\n\"de/, header)

    title
  end

  def get_authors(header) do
    [_ | [authors | _]] = Regex.run(~r/\"de\s(.*)\",,,\n\"Visu/, header)

    process_authors authors
  end

  defp process_authors(authors_string) do
    authors_string
      |> String.split(",")
      |> Enum.map( &(String.trim(&1)) )
  end
end
