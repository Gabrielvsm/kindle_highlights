defmodule FileHandler.Csv do
  # Contains information about the book
  @header_lines 7

  def header_from_csv(file_path) do
    file_path
      |> File.stream!
      |> Stream.take(@header_lines)
      |> Enum.join
  end

  def csv_content(file_path) do
    file_path
      |> File.stream!
      # Below the 7 book info header lines there is a csv header line
      |> Stream.drop(@header_lines + 1)
  end
end
