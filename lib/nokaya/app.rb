# encoding: utf-8
module Nokaya
  class App < Thor
    package_name "Nokaya"

    desc "instagram", "Get the main photo from an Instagram page"
    def instagram(*args)
      puts args.inspect
    end
  end
end
