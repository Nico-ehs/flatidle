class Producer < ApplicationRecord
	belongs_to :game
	
	def valid_purchase
	    game.get_stock.amount >= price
	end
end
