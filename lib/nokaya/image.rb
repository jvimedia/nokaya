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
    def self.save_image path, link
      content = self.get_image link
      f = File.new(path, "wb")
        f.puts(content)
      f.close
    end
    def self.get_image img_link
      begin
        open(img_link).read
      rescue
        abort Status.no_can_do
      end
    end
  end
end
