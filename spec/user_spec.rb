require 'spec_helper'
require 'capybara/rspec'

describe "the login page", :type => :feature do
	it "creates a new instance of user" do 
		visit '/login'
		username = 'test user #{(1..1000).sample}'
		fill_in :user_name, with: username
		find('input[name="commit"]').click
		expect(User.last.name).to eq username
	end
end