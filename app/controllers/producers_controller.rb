class ProducersController < ApplicationController
    
    def buy
        @producer=Producer.find_by_id(params[:id])
        stock=@producer.game.get_stock
        stock.amount -= (@producer.price)*(params[:amount].to_i)
        stock.save
        @producer.amount += (params[:amount].to_i)
        @producer.save
        redirect_to game_path(@producer.game)
    end
    
end
