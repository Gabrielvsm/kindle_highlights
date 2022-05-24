defmodule FileHandler.Text do
  def header_list(file_path) do
    header_lines = 7

    file_path
      |> File.stream!
      |> Stream.take(header_lines)
      |> Enum.to_list
  end
end
