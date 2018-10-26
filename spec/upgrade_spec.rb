


ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
RSpec.describe "Upgrade" do


  before(:each) do
    @game = Game.create()
    @game.create_default_game
  end



  
  context "first upgrade available" do
    it "has empty producers" do
      expect(@game).to eq(0)
    end
    

  end
  
  context "upgrade effects" do
    it "upgrade effects total_production" do
        
      expect(@game.production_multi).to eq(10)
    end
    

  end
 
 end
  