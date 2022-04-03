class CharactersController < ApplicationController

    before_action :authenticate_user!, only:[:create, :update]

    def new
        @character = Character.new
    end

    def view
        @characters = Character.all
        #@user = User.find(params[:id])
        #@characters = @user.characters.paginate(page: params[:page])
    end

    def create
        if user_signed_in?
            @character =current_user.characters.build(character_params)
            if @character.save!
                flash[:success] = "Micropost created!"
                redirect_to view_path
            else
                flash[:danger] = "キャラクターの登録に失敗しました"
            end
        else
            flash[:notice] = "ログイン済ユーザーのみキャラの登録が可能です"
            new_user_session _path
        end
    end

    def update
    end

    private

    def character_params
        params.require(:character).permit(:chara_name, :appear_in)
        #params.permit(:chara_name, :appear_in)
      end

end
