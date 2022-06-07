defmodule FileHandler.Markdown do
  def append_topics(path, topics) do
    case File.write(path, topics, [:append]) do
      :ok -> :ok
      {:error, reason} -> IO.puts "error: " <> reason
    end
  end
end
