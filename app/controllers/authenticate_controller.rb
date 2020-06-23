class AuthenticateController < ApplicationController
    
    def login
        @user = User.find_by(username: params[:username])

        if @user

            if @user.authenticate(params[:password])
                token= createToken(@user)
                render json: {
                    token: token,
                    results: @user.results
                }
            else
                render json: {message: "Wrong Password"}, status: :unauthorized
            end
        else
            render json: {message: "User not found"}, status: :unauthorized
        end
    end

end