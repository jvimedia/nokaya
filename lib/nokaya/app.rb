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
      check_args args
      nokaya = Getter.new options, :instagram, args
      basic nokaya
    end

    desc "favd", 'Get the photo from a Favd page (nokaya favd url)'
    option :name, aliases: "-n", type: :string, desc: "Specify a file name without extension"
    def favd *args
      check_args args
      nokaya = Getter.new options, :favd, args
      page = nokaya.parse_page
      img_link = nokaya.get_favd page
      save_pic img_link, nokaya
    end

    desc "adn", "Get the photo from a photos.app.net page (nokaya adn url)"
    option :name, aliases: "-n", type: :string, desc: "Specify a file name without extension"
    def adn *args
      check_args args
      nokaya = Getter.new options, :adn, args
      basic nokaya
    end

    desc "tumblr", "Get the photo from a Tumblr post (nokaya -tu url)"
    map "-tu" => :tumblr
    option :name, aliases: "-n", type: :string, desc: "Specify a file name without extension"
    def tumblr *args
      check_args args
      nokaya = Getter.new options, :tumblr, args
      basic nokaya
    end

    desc "tumblr_album", "Get all images from a Tumblr page (nokaya -tal url)"
    map "-tal" => :tumblr_album
    def tumblr_album *args
      check_args args
      nokaya = Getter.new options, :tumblr_album, args
      page = nokaya.parse_page
      img_links = nokaya.get_tumblr_album page
      puts img_links
      #save_album img_links, nokaya
    end

    desc "imgur_album", "Get all images from an Imgur album (nokaya -ial url)"
    map "-ial" => :imgur_album
    def imgur_album *args
      check_args args
      nokaya = Getter.new options, :imgur_album, args
      page = nokaya.parse_page
      img_links = nokaya.get_imgur_album page
      save_album img_links, nokaya
    end

    desc "flickr_album", "Get all images from a Flickr album (nokaya -fal url)"
    map "-fal" => :flickr_album
    def flickr_album *args
      check_args args
      nokaya = Getter.new options, :flickr_album, args
      page = nokaya.parse_page
      img_links = nokaya.get_flickr_album page
      save_album img_links, nokaya
    end

    private

    def basic nokaya
      page = nokaya.parse_page
      img_link = nokaya.get_basic page
      save_pic img_link, nokaya
    end

    def check_args args
      abort Status.no_url if args.empty?
    end

    def download_and_save img_link, nokaya
      puts Status.downloading img_link
      path = Image.photo_name nokaya
      Image.save_image(path, img_link)
      puts Status.saved path
    end

    def download_album img_links, nokaya
      puts Status.downloading_album nokaya
      img_links.each do |link|
        parsed = URI.parse link
        file = "#{Dir.home}/Downloads/#{parsed.path.split("/").last}"
        puts Status.saving file
        Image.save_image(file, link)
      end
      puts Status.done
    end

    def save_pic img_link, nokaya
      begin
        download_and_save img_link, nokaya
      rescue Interrupt
        abort Status.canceled
      end
    end

    def save_album img_links, nokaya
      begin
        download_album img_links, nokaya
      rescue Interrupt
        abort Status.canceled
      end
    end

  end
end
