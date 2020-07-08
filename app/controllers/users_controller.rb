class UsersController < ApplicationController

    before_action :authenticate, only: [:index, :show, :update, :destroy]

    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user, include: [:results]
    end

    def create
        @user = User.new(user_params)
        if @user.save
            token = createToken(@user)
            render json: {
                message: "Success user #{@user.username} has been created",
                token: token
            }
        else
            render json: { message: 1 }
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: @user
        else
            render json: {message: "Could not update"}
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: {message: "user deleted"}
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
