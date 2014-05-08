# encoding: utf-8
module Nokaya
  class App < Thor
    package_name "Nokaya"
    require_relative 'getter'
    require_relative 'image'
    require_relative 'status'

    desc "instagram", "Get the main photo from an Instagram page (nokaya -i url)"
    map "-i" => :instagram
    option :name, aliases: "-n", type: :string, desc: "Specify a file name without extension"
    def instagram *args
      abort Status.no_url if args.empty?
      nokaya = Getter.new options, :instagram, args
      page = nokaya.parse_page
      img_link = nokaya.get_instagram page
      download_and_save img_link, nokaya
    end

    desc "favd", 'Get the photo from a Favd page (nokaya favd url)'
    option :name, aliases: "-n", type: :string, desc: "Specify a file name without extension"
    def favd *args
      abort Status.no_url if args.empty?
      nokaya = Getter.new options, :favd, args
      page = nokaya.parse_page
      img_link = nokaya.get_favd page
      download_and_save img_link, nokaya
    end

    private

    def download_and_save img_link, nokaya
      puts Status.downloading img_link
      path = Image.photo_name nokaya
      Image.save_image(path, nokaya.get_image(img_link))
      puts Status.saved path
    end

  end
end
