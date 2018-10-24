class Producer < ApplicationRecord
	belongs_to :game
	
	def valid_purchase
	    game.get_stock.amount >= price
	end

	def calculate_price
		price = base_price * (growth_rate ** amount)
	end
end
