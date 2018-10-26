ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'spec_helper'

describe 'User', type: :feature do

    # let(:user_1) {User.create(name: "easy name")}
    # it 'creates a user' do
    #     visit '/login'
        
    #     fill_in "user_name", with: user_name
    #     find('input[name="commit"]').click

    #     expect(User.last.name).to eq(user_name)

    # end
    let(:user_name) {"user #{(100...999).to_a.sample}"}

    before do 
        game = Game.new()
        user = User.create(name: user_name)
        game.user = user
        game.save
    end


    let(:user) {User.last}
    it 'has a username' do 
        expect(user.name).to eq(user_name)
    end

    it "doesn't allow repeated user_names" do
        bad_user = User.new(name: user_name)
        expect(bad_user).to_not be_valid
    end

    # it "initiates a new game" do 

    # end
end
>>>>>>> dev
