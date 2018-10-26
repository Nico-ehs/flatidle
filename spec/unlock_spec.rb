ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'spec_helper'

describe 'Unlock', type: :feature do

    before do 
        user = User.find_or_create_by(name: "testing user")
        game = Game.new()
        game.user = user
        game.save
    end

    let(:game) {Game.last}

    it 'gives new games one producer unlock' do 
        expect(game.producers.size).to be(1)
    end

    it 'gives proceding unlocks after stock increases above producer price' do 
        stock = game.stocks.first
        stock.amount = 61
        stock.save
        game.apply_unlocks
    

        expect(game.producers.size).to be(2)
    end

    it "doesn't give free producers after unlock" do 
        expect(game.producers.last.amount).to be(0)
    end




    # it "initiates a new game" do 
        
    # end
end