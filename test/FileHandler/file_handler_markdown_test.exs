defmodule FileHandlerMarkdownTest do
  use ExUnit.Case
  doctest FileHandler.Markdown

  test "appends the topics to the file" do
    path = "./test.md"
    topic = "- (H) 2: highlight 1"
    FileHandler.Markdown.append_topics(path, topic)

    assert path
            |> File.stream!
            |> Stream.take(-1)
            |> Enum.join
            == topic
    File.rm path
  end
end
