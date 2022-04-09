module TextHandler
  class FileText
    def self.get_title(header)
      header.match(/"As notas do Kindle para:",,,\r\n^"(.*)",,,/)[1]
    end

    def self.get_authors(header)
      authors = header.match(/Kindle para:",,,\r\n^.*\r\n"de (.*)",,,\r\n$/)[1]
      authors.split(',').map { |author| author.strip }
    end

    def self.get_content(row)
      position = row[1].match(/^Posição (\d+)$/)[1].to_i
      content = { position: position }

      field = row[0].eql?('Destaque (Amarelo)') ? :highlight : :note
      content[field] = row[3]

      content
    end
  end
end
