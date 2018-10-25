
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
RSpec.describe "Game" do


  before(:each) do
    @game = Game.create()
  end

  context "attributes" do
    it "has empty producers" do
      expect(@game.producers).to eq(nil)
    end
  end

 
end