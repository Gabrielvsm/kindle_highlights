defmodule FileHandlerTestHelper do
  def csv_file(path \\ "./csv_tst.csv") do
    content = """
      "As notas do Kindle para:",,,
      "BOOK TITLE",,,
      "de author",,,
      "Visualização instantânea gratuita do Kindle:",,,
      "https://a.co/aGb4vrv",,,
      ----------------------------------------------,,,
      ,,,
      "Tipo de anotação","Posição","Com estrelas?","Anotação"
      "Destaque (Amarelo)","Posição 42","","first highlight"
      "Destaque (Amarelo)","Posição 43","","second highlight"
      "Nota","Posição 43","","note"
    """
    File.write path, content

    path
  end

  def delete_file(path) do
    File.rm! path
  end
end
