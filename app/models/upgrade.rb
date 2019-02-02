class Upgrade < ApplicationRecord
	has_many :available_upgrades
	has_many :games, through: :available_upgrades
end
