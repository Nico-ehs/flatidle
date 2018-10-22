class Upgrade < ApplicationRecord
	has_many :upgrade_purchases
	has_many :games, through :upgrade_purchases
end
