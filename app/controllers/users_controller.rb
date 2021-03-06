class UsersController < ApplicationController
  before_action :set_q, only: [:index, :search]
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user =User.find(params[:id])
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to root_path
  end




  #=====検索機能=============
  def search
    @results = @q.result.page(params[:page])
  end

  private

  def set_q
    @q = User.ransack(params[:q])
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end


end
