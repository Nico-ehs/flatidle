class UsersController < ApplicationController
    # def new
    #     @user = User.new
    # end

    def create
        @user = User.find_or_create_by(user_params)
        if @user.save
            session[:user_id] = @user.id
            #loads first game
            if @user.games.any?
                redirect_to game_path(@user.games.first)
            else
                new_game = Game.new
                @user.games << new_game
                new_game.save!
                redirect_to game_path(new_game)
            end
        else
            render :'sessions/new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name)
    end
    
end
