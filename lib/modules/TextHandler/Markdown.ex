defmodule TextHandler.Markdown do
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
