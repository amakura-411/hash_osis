class UsersController < ApplicationController
  before_action :set_q, only: [:index, :search]
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user =User.find(params[:id])
    @characters =@user.favorited_characters.page(params[:page])
  end


  #=====検索機能=============
  def search
    @results = @q.result
  end

  private

  def set_q
    @q = User.ransack(params[:q])
  end


end
