# encoding: utf-8
module Nokaya
  class Getter
    def initialize *args
      @args = OpenStruct.new options: args[0], type: args[1], url: args[2][0]
    end
    def args
      @args.inspect
    end
    def options
      @args.options
    end
    def type
      @args.type
    end
    def url
      @args.url
    end
    def get_image img_link
      open(img_link).read
    end
    def get_link page
      page.xpath("//meta[@property='og:image']/@content").first
    end
    def photo_name
      unless @args.options[:name]
        Dir.home + "/Downloads/#{@args.type.to_s}-#{Time.now.to_i}.jpg"
      else
        Dir.home + "/Downloads/#{@args.type.to_s}-#{@args.options[:name]}.jpg"
      end
    end
    def parse_page
      Nokogiri::HTML get_page_content
    end
    def save_image path, img_link
      f = File.new(path, "wb")
        f.puts(get_image img_link)
      f.close
    end
    private
    def get_page_content
      open @args.url
    end
  end
end
