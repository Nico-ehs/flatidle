
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
RSpec.describe "Game" do


  before(:each) do
    @game = Game.create()
  end



  
  context "create_default_game" do
    it "starts empty" do
      expect(@game.producers.size).to eq(0)
    end
    
    
    it "has default producers" do
      expect(@game.producers.size).to eq(0)
    end
  end

end