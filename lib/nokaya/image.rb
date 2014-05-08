# encoding: utf-8
module Nokaya
  class Image
    def self.photo_name nokaya
      unless nokaya.options[:name]
        Dir.home + "/Downloads/#{nokaya.type.to_s}-#{Time.now.to_i}.jpg"
      else
        Dir.home + "/Downloads/#{nokaya.type.to_s}-#{nokaya.options[:name]}.jpg"
      end
    end
    def self.save_image path, content
      f = File.new(path, "wb")
        f.puts(content)
      f.close
    end
  end
end
