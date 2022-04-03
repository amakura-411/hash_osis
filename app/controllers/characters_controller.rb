class CharactersController < ApplicationController

    before_action :authenticate_user!, only:[:create, :update]

    def show
        @user = User.find(params[:id])
        @characters = @user.characters.paginate(page: params[:page])
    end

    def create
        @character = current_user.characters.build(character_params)
    end

    def update
    end

end
