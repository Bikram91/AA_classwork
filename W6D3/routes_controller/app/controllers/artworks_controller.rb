class ArtworksController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render jdons:@user.errors.full_messages
            status: :unprocessable_entity
        end
    end

    def destroy 
        @user = User.find_by(id:, params[:id])
        @user.destroy

        render json: user["deleted"]
    end

    def show
        @user = User.find_by(id:, params[:id])
        render json: @user
    end

    private
    def require_user 
        params.require(:artwork).permit(:title, :artist_id)
    end
end
