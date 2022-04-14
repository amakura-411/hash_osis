class ApplicationController < ActionController::Base
  #include SessionsHelper
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?

  private
  #デバイスでフレンドリーフォワーディング導入
  #getメソッドで、ログインとかじゃなく、Ajaxとかでもない場合
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    #上の条件以外の時に活用
    store_location_for(:user, request.fullpath)
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :username, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

       
end
