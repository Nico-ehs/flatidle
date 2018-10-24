class AvailableUpgradesController < ApplicationController
    def buy
        @available_upgrade=AvailableUpgrade.find_by_id(params[:id])
        @available_upgrade.purchased=true
        @available_upgrade.save if @available_upgrade.game.spend(@available_upgrade.upgrade.price)
        redirect_to game_path(@available_upgrade.game)
    end
end
