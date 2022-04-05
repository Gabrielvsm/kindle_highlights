module FileHandler
  class Files
    def self.get_header(file)
      File.foreach(file).first(3).join
    end
  end
end
