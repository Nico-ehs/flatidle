class UpgradePurchase < ApplicationRecord
	belongs_to :game
	belongs_to :upgrade
end
