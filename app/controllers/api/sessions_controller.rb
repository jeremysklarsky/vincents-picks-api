module Api

  class SessionsController < Api::BaseController
    # prepend_before_filter :require_no_authentication, :only => [:create ]
    
    # before_filter :ensure_params_exist
   
    respond_to :json
    
    def create
      binding.pry  
      if User.find_by(:email => params[:session][:email])
        @user = User.find_by(:email => params[:session][:email])
      end

      if @user.valid_password?(params[:session][:password])   
        respond_to do |format|
          format.json { render :json => @user }  # note, no :location or :status options
        end
      else
        invalid_login_attempt
      end

    end
       
    def destroy
      user = User.find_by(auth_token: params[:id])
      user.generate_authentication_token!
      user.save
      head 204
    end

    protected
      def ensure_params_exist
        return unless params[:user_login].blank?
        render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
      end
     
      def invalid_login_attempt
        # warden.custom_failure!
        render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
      end

  end

end
