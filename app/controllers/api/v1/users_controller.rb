class Api::V1::UsersController < ApplicationController

    skip_before_action :authorized, only: [:signup]

    def signin
        user = User.find_by(username: params[:username])
        if user and user.authenticate(params[:password])
          # we know user managed to sign in
          render json: { username:  user.username, userid: user.id, token: issue_token({ id: user.id }) }
        else
          # we know the sign in failed
          render json: { error: 'Username/password invalid.' }, status: 403
        end
    end
    
    def signup
      user = User.create(new_user_params)
      if user.valid?
      render json: { username:  user.username, userid: user.id, token: issue_token({ id: user.id }) }
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end
    
    private
    
    def new_user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end 

end


