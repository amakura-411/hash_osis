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
#消された要素があるとき、リストから要素を消す
    #送信後のリストを呼び出す
    element_list =params[:character][:element_list]
    #消された要素を確定＝キャラに紐づけられたデータ　-　送信データ
    remove_elements = @character.element_list - element_list if element_list
    #リストから削除
    @character.element_list.remove(remove_elements) if remove_elements
#増えた要素があるとき、リストに要素を足す
    #送信された要素
    # element_list =params[@character.downcase][:element_list]
    #増えた要素を確定=送信データ - キャラのデータ
    add_elements = element_list - @character.element_list if element_list
    #リストに追加
    @character.element_list.add(add_elements) if add_elements
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
