defmodule KindleHighlights do
  require FileHandler.Csv
  require TextHandler.Csv

  # source is the .csv file and destination the processed .md file
  def main([source, dest]) do
    [title, authors] = extract_from_header source
    content = extract_content source

    markdown_header [title, authors], dest
    markdown_body content, dest
  end

  defp markdown_header([title, authors], dest) do
    {title, authors} |> TextHandler.Markdown.markdown_header |> FileHandler.Markdown.write_header(dest)
  end

  defp markdown_body(content, dest) do
    content = Enum.map(content, &(TextHandler.Markdown.row_to_topic &1))

    FileHandler.Markdown.append_topics content, dest
  end

  defp extract_from_header(file) do
    header = FileHandler.Csv.header_from_csv file 

    [TextHandler.Csv.get_title(header), TextHandler.Csv.get_authors(header)]
  end

  defp extract_content(file) do
    file |> FileHandler.Csv.csv_content |> TextHandler.Csv.get_content
  end
end

KindleHighlights.main System.argv
