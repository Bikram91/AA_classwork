class UsersController < ApplicationController

    def create
        @user = User.new(require_user)
        if @user.save
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy 
        @user = User.find_by(id: params[:id])
         if @user.destroy
            render json: @user["deleted"]
         end
    end

    def index
        render json: User.all
    end


    def show
       @user = User.find_by(id: params[:id])
        render json: @user
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(require_user)
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    def require_user 
        params.require(:user).permit(:username)
    end

end
