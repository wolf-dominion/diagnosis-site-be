class ResultsController < ApplicationController

    before_action :authenticate, only: [:index, :create]
    
    def index

        @results = Result.where(user_id: @user_id)
        render json: {user_id: @user_id, results: @results}
    end

    def show
        @results = Result.where(user_id: params[:id])
        render json: {user_id: @user_id, results: @results}
    end

    def create
        @result = Result.create(result_params)
        render json: @result
    end
    
    def destroy
        @result = Result.find(params[:id])
        @result.destroy
    end

    private

    def set_fm
        @result = Result.find(params[:id])
      end

    def result_params
        params.require(:result).permit(:empathy, :communication, :sharedecision).merge(user_id: @user_id)
    end

end
