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
    def self.error
      "\nAn unknown error happened.\n\n"
    end
    def self.canceled
      "\nCanceled.\n\n"
    end
    def self.saving file
      "Saving #{file}\n"
    end
    def self.done
      "\nDone.\n\n"
    end
    def self.downloading_album dir
      "\nDownloading album at #{dir}/...\n\n"
    end
  end
end
