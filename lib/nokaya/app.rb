# encoding: utf-8
module Nokaya
  class App < Thor
    package_name "Nokaya"
    require_relative 'getter'

    desc "instagram", "Get the main photo from an Instagram page"
    map "-ins" => :instagram
    def instagram *args
      nokaya = Getter.new options, :instagram, args
      page = nokaya.parse_page
      img_link = page.xpath("//meta[@property='og:image']/@content").first
      path = Dir.home + "/Downloads/instagram-#{Time.now.to_i}.jpg"
      puts "Downloading #{img_link}, please wait...\n"
      f = File.new(path, "wb")
        f.puts(nokaya.get_image img_link)
      f.close
      puts "\nImage saved in #{path}\n\n"
    end
  end
end
