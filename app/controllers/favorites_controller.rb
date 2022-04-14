class FavoritesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

def show
    @user =User.find(params[:user_id])
    @characters =@user.favorited_characters.page(params[:page])

end


  def create
    character = Character.find(params[:character_id])
    favorite = current_user.favorites.new(character_id: character.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    character = Character.find(params[:character_id])
    favorite = current_user.favorites.find_by(character_id: character.id)
    favorite.destroy
    redirect_to request.referer
  end

end

