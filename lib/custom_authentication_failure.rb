class CustomAuthenticationFailure < Devise::FailureApp 
    protected
      def redirect_url
        #redirect_to
        new_user_session_path
      end
    end