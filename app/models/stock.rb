class Stock < ApplicationRecord
    validates :amount, numericality: { greater_than_or_equal_to: 0 }
	belongs_to :game
end
