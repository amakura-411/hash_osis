class CharactersController < ApplicationController


before_action :authenticate_user!, :except=>[:index]

def new
    @character = Character.new
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

#
def update
    @character = Character.find(params[:id])

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
        @elements = Character.tag_counts_on(:elements).most_used(20)    # タグ一覧表示
    end

    def show
        @character = Character.find(params[:id])
        @elements = @character.tag_counts_on(:elements)    # 投稿に紐付くタグの表示
    end

    private

    def character_params
        params.require(:character).permit(:chara_name, :appear_in, element_list:[])
    end




end
