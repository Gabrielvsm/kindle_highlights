require 'csv'
require_relative 'modules/modules'

file_path = ARGV[0] || ENV['CSV_PATH']
md_path = ARGV[1] || ENV['MD_PATH']

header = FileHandler::Files.get_header file_path
title = TextHandler::FileText.get_title header
authors = TextHandler::FileText.get_authors header

File.open(md_path, 'a') do |md|
  md.puts "\# #{title.capitalize}\n"
  md.puts "Author(s): #{authors}\n"
  md.puts "\n"

  CSV.parse(File.readlines(file_path).drop(8).join) do |row|
    content = TextHandler::FileText.get_content row
    # type 'H' for highlight and 'N' for note
    type = content.key?(:highlight) ? 'H' : 'N'
    md.puts "- #{type}(#{content[:position]}): #{content.values[1]}"
  end
end
