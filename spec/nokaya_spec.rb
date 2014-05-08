require 'spec_helper'

describe Nokaya::Getter do
  describe "#args" do
    it 'shows the args' do
      obj = Nokaya::Getter.new({}, :instagram, ['http://instagram.com/p/nlUKF9TYEs/'])
      expect(obj.args).to eq '#<OpenStruct options={}, type=:instagram, url="http://instagram.com/p/nlUKF9TYEs/">'
    end
  end
  # describe "#get_page" do
  #   it 'gets the page' do
  #     obj = Nokaya::Getter.new({}, :instagram, ['http://instagram.com/p/nlUKF9TYEs/'])
  #     expect(obj.get_page).to eq ''
  #   end
  # end
end
