class UsersController < ApplicationController
    # def new
    #     @user = User.new
    # end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            #loads first game
            redirect_to game_path(@user.games.first)
        else
            render :'sessions/new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name)
    end
    
end
