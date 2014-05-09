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
    def get_basic page
      page.xpath("//meta[@property='og:image']/@content").first
    end
    def get_favd page
      page.css('#largeImage')[0]['src']
    end
    def get_deviantart page
      refs = page.css('a.thumb')
      links = []
      refs.each {|li| links << li['data-super-img']}
      links
    end
    def get_imgur_album page
      refs = page.css('#imagelist .posts .post a')
      links = []
      refs.each {|l| links << "http:#{l['href']}"}
      links
    end
    def get_tumblr_album page
      queries = ['img.photo', '.post .photo a img', '.entry img', 'article img', '.image img', '.item_content img', 'img.post-image', '.box img', '#allposts img', '.media img', '.wide img', '.big img', '.large img', '.gallery img', '.photos img', '.content img', 'img']
      queries.each do |query|
        @refs = page.css query
        next if @refs.empty?
        break
      end
      links = []
      @refs.each do |l|
        target = l['src']
        unless (target == 'reblog.png' || target =~ /statcounter/ || target =~ /impixu/ || target =~ /quantserve/ || target == 'like.png')
          links << target
        end
      end
      links
    end
    def get_flickr_album page
      refs = page.css('.pc_img')
      links = []
      refs.each {|l| links << l['data-defer-src']}
      links
    end
    def get_photonet_album page
      refs = page.css '.trp-top a'
      links = []
      refs.each do |lin|
        links << "http://gallery.photo.net/photo/#{lin['href'].split("=").last}-lg.jpg"
      end
      links
    end
    def parse_page
      Nokogiri::HTML(open @args.url)
    end
  end
end
