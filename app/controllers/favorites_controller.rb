class FavoritesController < ApplicationController
  before_action :authenticate_user!, except: [:edit]

  #users see our_favorites
  def edit
    @user = User.find(params[:user_id])
    @characters =@user.favorited_characters
  end


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

  private
  def set_user
    @user = User.find(params[:id])
  end
end

