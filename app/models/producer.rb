class Producer < ApplicationRecord
	belongs_to :game
	attr_accessor :ajusted_value
	attr_accessor :ajusted_rate
	
	def valid_purchase
	    game.get_stock.amount >= price
	end

	def calculate_price
		base_price * (growth_rate ** amount)
	end
end
