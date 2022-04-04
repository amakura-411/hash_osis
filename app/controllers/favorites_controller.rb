class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    flash[:notice] = "いいね機能はログイン中のみ使えます" unless user_signed_in?
    character = Character.find(params[:character_id])
    favorite = current_user.favorites.new(character_id: character.id)
    favorite.save
    redirect_to characters_path
  end

  def destroy
    flash[:notice] = "いいね機能はログイン中のみ使えます" unless user_signed_in?
    character = Character.find(params[:character_id])
    favorite = current_user.favorites.find_by(character_id: character.id)
    favorite.destroy
    redirect_to characters_path
  end
end
