defmodule FileHandlerCsvTest do
  use ExUnit.Case
  doctest FileHandler.Csv

  setup_all do
    {:ok, file: FileHandlerTestHelper.csv_file}
  end

  test "extracts the the header containing the info about the book of a file", state do
    expected_header = """
      "As notas do Kindle para:",,,
      "BOOK TITLE",,,
      "de author",,,
      "Visualização instantânea gratuita do Kindle:",,,
      "https://a.co/aGb4vrv",,,
      ----------------------------------------------,,,
      ,,,
    """
    
    assert FileHandler.Csv.header_from_csv(state[:file]) == expected_header
    File.rm! "./csv_tst.csv"
  end
end
