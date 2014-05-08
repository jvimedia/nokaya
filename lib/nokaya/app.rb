# encoding: utf-8
module Nokaya
  class App < Thor
    package_name "Nokaya"

    desc "test", "test"
    def test
      puts 'ok'
    end
  end
end
