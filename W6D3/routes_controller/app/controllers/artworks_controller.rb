class ArtworksController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
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

    def index
        User.all
        
    end

    def show
        User.find_by(id:, params[:id])
    end

    private
    def require_user 
        params.require(:artwork).permit(:title, :artist_id)
    end
end
