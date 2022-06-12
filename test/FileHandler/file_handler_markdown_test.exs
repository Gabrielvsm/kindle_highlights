defmodule FileHandlerMarkdownTest do
  use ExUnit.Case
  doctest FileHandler.Markdown

  setup_all do
    {:ok, path: "./test.md"}
  end

  test "saves the markdown header on the file", state do
    md_header = "# Book Title\nAuthors: #author1 #author2\n---"
    FileHandler.Markdown.write_header(state[:path], md_header)

    assert File.read!(state[:path]) == md_header
    File.rm state[:path]
  end

  test "appends the topics to the file", state do
    topic = "- (H) 2: highlight 1"

    assert FileHandler.Markdown.append_topics(state[:path], topic) == :topics_ok
    assert state[:path]
            |> File.stream!
            |> Stream.take(-1)
            |> Enum.join
            == topic
    File.rm state[:path]
  end
end
