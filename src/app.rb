require 'csv'
require_relative 'modules/modules'
require_relative 'book'

file_path = ARGV[0] || './file1.csv'
md_path = ARGV[1] || './file1.md' # ENV['MD_PATH']

header = FileHandler::Files.get_header file_path
title = TextHandler::FileText.get_title header
authors = TextHandler::FileText.get_authors header

book = Book.new(title, authors, {})

File.open(md_path, 'a') do |md|
  md.puts "\# #{title.capitalize}\n"
  md.puts "Author(s): #{authors}\n"
  md.puts "\n"
  CSV.parse(File.readlines(file_path).drop(8).join) do |row|
    content = TextHandler::FileText.get_content row
    md.puts "- #{content[:position]}: #{content.values[1]}"
  end
end
