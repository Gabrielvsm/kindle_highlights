defmodule FileHandler.Markdown do
  def write_header(header, path) do
    File.write! path, header
  end

  def append_topics(topics, path) do
    case File.write(path, topics, [:append]) do
      :ok -> :topics_ok
      {:error, reason} -> IO.puts "error: " <> reason
    end
  end
end
