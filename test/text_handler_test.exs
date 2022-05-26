defmodule TextHandlerTest do
  use ExUnit.Case
  doctest TextHandler

  setup_all do
    {:ok, header: "\uFEFF\"As notas do Kindle para:\",,,\n\"PAPO DE GRANA: FAÇA O DINHEIRO TRABALHAR PARA VOCÊ\",,,\n\"de Tito Gusmão\",,,\n\"Visualização instantânea gratuita do Kindle:\",,,\n\"https://a.co/aGb4vrv\",,,\n----------------------------------------------,,,\n,,,\n"}
  end

  test "extracts the title from the header", state do
    assert TextHandler.get_title(state[:header]) == "PAPO DE GRANA: FAÇA O DINHEIRO TRABALHAR PARA VOCÊ"
  end

  test "extracts a list of authors", state do
    authors = TextHandler.get_authors(state[:header])

    assert is_list(authors)
    assert authors == ["Tito Gusmão"]
  end
end
