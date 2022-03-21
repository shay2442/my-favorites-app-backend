class SessionsController < ApplicationController
    skip_before_action :authorized 
     
    def get_current_user
         #get token and decode token to get current user 
         render json: current_user
        #  current_user takes in all the code from application_controller
    end

    
    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            @token = encode_token({ user_id: @user.id})
            render json: { user: @user, token: @token }, status: :ok
        else
            render json: { errors: ["Incorrect username or password"]}, status: unprocessible_entity
        end
    end
end
