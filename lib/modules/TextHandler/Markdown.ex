defmodule TextHandler.Markdown do
  def markdown_header({title, authors_list}) do
    authors_string = Enum.map_join(authors_list, " ", &("##{String.replace &1, " ", "_"}"))

    "# #{title}\nAuthors: #{authors_string}\n---"
  end

  def row_to_topic(row) do
    [type | row] = row
    [position | row] = row
    [text | _] = row

    "- (#{which_type type}) #{position}: #{text}"
  end

  defp which_type(type) do
    case type do
      "Destaque" -> "H"
      "Nota" -> "N"
    end
  end
end
