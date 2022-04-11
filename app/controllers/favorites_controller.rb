class FavoritesController < ApplicationController
  before_action :authenticate_user!, except: [:edit]



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

  private
  def set_user
    @user = User.find(params[:id])
  end
end

