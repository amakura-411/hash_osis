class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user =User.find(params[:id])
    @characters =@user.favorited_characters.page(params[:page])
  end
end
