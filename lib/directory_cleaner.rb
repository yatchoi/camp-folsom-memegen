require 'fileutils'

class DirectoryCleaner
  def self.clean
    if Dir.entries("./public/meme").size >= 7
      delete_dir = File.join("**", "public", "**", "meme", "*jpeg")
      FileUtils.rm(Dir.glob(delete_dir))
    end
  end
end
