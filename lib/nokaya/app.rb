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
      img_link = nokaya.get_basic page
      begin
        download_and_save img_link, nokaya
      rescue Interrupt
        abort Status.canceled
      end
    end

    desc "favd", 'Get the photo from a Favd page (nokaya favd url)'
    option :name, aliases: "-n", type: :string, desc: "Specify a file name without extension"
    def favd *args
      abort Status.no_url if args.empty?
      nokaya = Getter.new options, :favd, args
      page = nokaya.parse_page
      img_link = nokaya.get_favd page
      begin
        download_and_save img_link, nokaya
      rescue Interrupt
        abort Status.canceled
      end
    end

    desc "adn", "Get the photo from a photos.app.net page (nokaya adn url)"
    option :name, aliases: "-n", type: :string, desc: "Specify a file name without extension"
    def adn *args
      abort Status.no_url if args.empty?
      nokaya = Getter.new options, :adn, args
      page = nokaya.parse_page
      img_link = nokaya.get_basic page
      begin
        download_and_save img_link, nokaya
      rescue Interrupt
        abort Status.canceled
      end
    end

    desc "tumblr", "Get the photo from a Tumblr photo page (nokaya -t url)"
    map "-t" => :tumblr
    option :name, aliases: "-n", type: :string, desc: "Specify a file name without extension"
    def tumblr *args
      abort Status.no_url if args.empty?
      nokaya = Getter.new options, :tumblr, args
      page = nokaya.parse_page
      img_link = nokaya.get_basic page
      begin
        download_and_save img_link, nokaya
      rescue Interrupt
        abort Status.canceled
      end
    end

    desc "imgur_album", "Get all images from an Imgur album (nokaya -ial url)"
    map "-ial" => :imgur_album
    def imgur_album *args
      abort Status.no_url if args.empty?
      nokaya = Getter.new options, :imgur_album, args
      page = nokaya.parse_page
      img_links = nokaya.get_imgur_album page
      begin
        download_album img_links, nokaya
      rescue Interrupt
        abort Status.canceled
      end
    end

    desc "flickr_album", "Get all images from a Flickr album (nokaya -fal url)"
    map "-fal" => :flickr_album
    def flickr_album *args
      abort Status.no_url if args.empty?
      nokaya = Getter.new options, :flickr_album, args
      page = nokaya.parse_page
      img_links = nokaya.get_flickr_album page
      begin
        download_album img_links, nokaya
      rescue Interrupt
        abort Status.canceled
      end
    end

    private

    def download_and_save img_link, nokaya
      puts Status.downloading img_link
      path = Image.photo_name nokaya
      Image.save_image(path, nokaya.get_image(img_link))
      puts Status.saved path
    end

    def download_album img_links, nokaya
      puts Status.downloading_album nokaya
      img_links.each do |link|
        parsed = URI.parse link
        file = "#{Dir.home}/Downloads/#{parsed.path.split("/").last}"
        puts Status.saving file
        Image.save_image(file, nokaya.get_image(link))
      end
      puts Status.done
    end

  end
end
