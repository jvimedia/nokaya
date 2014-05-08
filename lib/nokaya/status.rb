# encoding: utf-8
module Nokaya
  class Status
    def self.downloading img_link
      "\nDownloading #{img_link}, please wait...\n\n"
    end
    def self.saved path
      "Image saved in #{path}\n\n"
    end
    def self.no_can_do
      "Canceled: unable to get the page contents.\n\n"
    end
    def self.no_url
      "\nYou have to specify a page URL.\n\n"
    end
  end
end