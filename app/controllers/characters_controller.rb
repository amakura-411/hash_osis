class CharactersController < ApplicationController


before_action :authenticate_user!, :except=>[:index]



    #Only_login_users
    def new
        @character = Character.new
        @hair_colors =ActsAsTaggableOn::Tag.all
end



def create
        @character =current_user.characters.build(character_params)
        if @character.save
            flash[:notice] = "登録が完了しました!"
            redirect_to ({controller: :characters, action: :index})
        else
            redirect_to ({controller: :characters, action: :new})
            flash[:alert] = "既にキャラクターが登録されています"
        end
end

def edit
   @character = Character.find(params[:id])
end

def update
    @character = Character.find(params[:id])
   # @character = Character.find_by(id: params[:id])
    if@character.update(character_params)
        flash[:notice] = "登録が完了しました!"
        redirect_to  ({controller: :characters, action: :index})
    else
        flash[:alert] = "キャラクターの登録に失敗しました"
        redirect_to ({controller: :characters, action: :edit})
    end
end

    def index
        @characters = Character.all.page(params[:page])
    end

    def show
        @character = Character.find(params[:id])
    end

    private

    def character_params
        params.require(:character).permit(:chara_name, :appear_in, 
            :hair_color_list, :eye_color_list,)
    end




end
