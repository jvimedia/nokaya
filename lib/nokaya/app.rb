# encoding: utf-8
module Nokaya
  class App < Thor
    package_name "Nokaya"
    require_relative 'getter'

    desc "instagram", "Get the main photo from an Instagram page (nokaya -i url)"
    map "-i" => :instagram
    option :name, aliases: "-n", type: :string, desc: "Specify a file name without extension (nokaya -i url -n some_name)"
    def instagram *args
      nokaya = Getter.new options, :instagram, args
      page = nokaya.parse_page
      img_link = nokaya.get_link page
      path = nokaya.photo_name
      puts "Downloading #{img_link}, please wait...\n"
      nokaya.save_image path, img_link
      puts "\nImage saved in #{path}\n\n"
    end
  end
end
