# KindleHighlights :bookmark_tabs:

Tool built to automate my process of processing exported kindle highlights into markdown topics for further use.
Also built as a study on Elixir development.

## The way it works :gear:

FileHandler modules manage manipulations on files: extracting headers, file lines, saves the processed
anotations on the .md file, etc.
TextHandler modules on the other hand process the data extracted by the FileHandlers: extracts the book title and author(s)
and processes the highlights and notes from the lines.
