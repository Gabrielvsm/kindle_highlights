defmodule FileHandlerTextTest do
  use ExUnit.Case
  doctest FileHandlerText

  test "returns a list containing the header lines" do
    assert FileHandler.Text.header_list()
  end
end
