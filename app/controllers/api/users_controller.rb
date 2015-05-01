module Api

  class UsersController < Api::BaseController

    # def update
    #   user = current_user

    #   if user.update(user_params)
    #     render json: user, status: 200, location: [:api, user]
    #   else
    #     render json: { errors: user.errors }, status: 422
    #   end
    # end


    def create
      @user = User.new(user_params)
      if @user.save
        render :nothing => true, :status => 200
      else
        render json: get_resource.errors, status: :unprocessable_entity
      end      
    end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

  end

end
