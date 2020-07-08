class ApplicationController < ActionController::API

    def secret
        # 2nd option is for if this app is deployed/production, 1st is for dev
        Rails.application.secrets.secret_key_base || Rails.application.secret_key_base
    end

    def authenticate
        authorization_header = request.headers["Authorization"]

        if authorization_header
            token = authorization_header.split(" ")[1]
            begin
                @user_id = JWT.decode(token, secret)[0]["user_id"]
            rescue
                render json: {message: "The credentials are wrong"}, status: :unauthorized
            end
        else
            render json: {message: "There was no or incorrect auth header"}, status: :unauthorized
        end
    end

    def createToken(user)
        payload = { user_id: user.id }
        JWT.encode(payload, secret)
    end

end