class Producer < ApplicationRecord
	belongs_to :game

	attr_accessor :ajusted_value
	attr_accessor :ajusted_rate

	GROWTH_MODIFIER = 0.1

	
	def valid_purchase
	    game.get_stock.amount >= self.price
	end

	def calculate_price
		base_price * (growth_rate ** amount)
		self.price = base_price * ((growth_rate + GROWTH_MODIFIER) ** amount)
	end
end
