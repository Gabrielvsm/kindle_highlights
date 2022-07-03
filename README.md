# KindleHighlights :bookmark_tabs:

Tool built to automate my process of processing exported kindle highlights into markdown topics for further use.
Also built as a study on Elixir development.

## The way it works :gear:

FileHandler modules manage manipulations on files: extracting headers, file lines, saves the processed
anotations on the .md file, etc.
TextHandler modules on the other hand process the data extracted by the FileHandlers: extracts the book title and author(s)
and processes the highlights and notes from the lines.

## Running it :runner:

To convert the csv highlights file you simply run the app passing the `<source_file>` and `<destination_file>`, those being, respectively, the .csv and the .md
```bash
> mix run lib/kindle_highlights.ex <source_csv_path> <destination_markdown_path>
```
