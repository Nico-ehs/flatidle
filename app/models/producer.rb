class Producer < ApplicationRecord
	belongs_to :game
	GROWTH_MODIFIER = 0.1
	
	def valid_purchase
	    game.get_stock.amount >= self.price
	end

	def calculate_price
		self.price = base_price * ((growth_rate + GROWTH_MODIFIER) ** amount)
	end
end
