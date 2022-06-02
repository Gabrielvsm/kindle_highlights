defmodule TextHandler.Csv do
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

  def get_content(content_stream) do
    content_stream
      |> Enum.map( &(hd apply_regex(&1)) )
  end

  defp apply_regex(row) do
    Regex.scan(
      ~r/(Destaque|Nota).*Posição (\d+).*\",\"(.*)\"/,
      row,
      capture: :all_but_first
    )
  end
end
