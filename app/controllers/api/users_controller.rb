module Api

  class UsersController < Api::BaseController

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

  end

end
