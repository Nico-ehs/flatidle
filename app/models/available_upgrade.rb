class AvailableUpgrade < ApplicationRecord
	belongs_to :game
	belongs_to :upgrade
end
