class CharactersController < ApplicationController
before_action :authenticate_user!, only: [:new, :edit]
before_action :set_q, only: [:index, :search]
before_action :admin_user, only: [:destroy]


def new
    @character = Character.new
end



def create
        @character =current_user.characters.build(character_params)
        @character.image.attach(params[:character][:image])
        if @character.save
            flash[:notice] = "登録が完了しました!"
            redirect_to action: "index"
        else
            redirect_to action: "new"
        end
end

def edit
   @character = Character.find(params[:id])
end

def update
    @character = Character.find(params[:id])
    if@character.update(character_params)
        flash[:notice] = "更新しました!"
        redirect_to action: "index"
    else
        redirect_to action: "edit"
    end
end

    def index
        @characters = Character.all.page(params[:page])
        @elements   = Character.tag_counts_on(:elements).most_used(20) 
        if @element = params[:element]
            @character = Character.tagged_with(params[:element])
        end
    end

    def show
        @character = Character.find(params[:id])
        @elements = @character.tag_counts_on(:elements)
    end

    def search
        @results = @q.result.page(params[:page])
    end
    



    def destroy
        Character.find(params[:id].destroy)
        flash[:success] = 'キャラの削除ができました'
        redirect_to  'index'
    end

    private


    def character_params
        params.require(:character).permit(:chara_name, :appear_in, :image, element_list: [])
    end


    def set_q
        @q = Character.ransack(params[:q])
    end

    def admin_user
        redirect_to(root_path) unless current_user.admin?
    end



end
