class Game < ApplicationRecord

	belongs_to :user

	has_many :stocks
	has_many :producers

	has_many :upgrade_purchases
	has_many :upgrades, through: :upgrade_purchases


end
