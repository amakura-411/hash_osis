class CharactersController < ApplicationController


    before_action :authenticate_user!, :except=>[:index]


    def index
        @characters = Character.all
    end


    #Only_login_users
    def new
            @character = Character.new
    end

    def create
            @character =current_user.characters.build(character_params)
            if @character.save
                #flash[:success] = "Micropost created!"
                redirect_to characters_path
            else
                flash[:danger] = "キャラクターの登録に失敗しました"
            end
    end

    def show

    end

    def edit
       @character = Character.find(params[:id])
    end

    def update
        @character = Character.find(params[:id])
       # @character = Character.find_by(id: params[:id])
        if@character.update(character_params)
            redirect_to characters_path
        else
            flash[:danger] = "キャラクターの登録に失敗しました"
        end
    end


    private

    def character_params
        params.require(:character).permit(:chara_name, :appear_in)
        #params.permit(:chara_name, :appear_in)
    end




end
