class ApplicationController < ActionController::Base
       #include SessionsHelper
       protect_from_forgery with: :exception
       before_action :configure_permitted_parameters, if: :devise_controller?

       after_action  :store_location
       def store_location
         if (request.fullpath != "/users/sign_in" &&
             request.fullpath != "/users/sign_up" &&
             request.fullpath != "/view" &&
             request.fullpath !~ Regexp.new("\\A/users/password.*\\z") &&
             !request.xhr?) # don't store ajax calls
           session[:previous_url] = request.fullpath 
         end
        end

    
       protected

       def configure_permitted_parameters
         added_attrs = [ :email, :username, :password, :password_confirmation ]
         devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
         devise_parameter_sanitizer.permit :account_update, keys: added_attrs
         devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
       end

       
end
