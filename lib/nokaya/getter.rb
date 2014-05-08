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
      begin
        open(img_link).read
      rescue
        abort Status.no_can_do
      end
    end
    def get_link page
      page.xpath("//meta[@property='og:image']/@content").first
    end
    def parse_page
      Nokogiri::HTML get_page_content
    end
    private
    def get_page_content
      open @args.url
    end
  end
end
