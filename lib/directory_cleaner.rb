require 'fileutils'

class DirectoryCleaner

  MAX_IMAGES = 100

  def self.clean
    if Dir.entries("./public/meme").size >= MAX_IMAGES
      delete_dir = File.join("**", "public", "**", "meme", "*jpeg")
      FileUtils.rm(Dir.glob(delete_dir))
    end
  end
end
