class ArtworkSharesController < ApplicationController
    def index
        render json: ArtworkShare.all
    end


    def create
        @artwork_share = ArtworkShare.new(require_artwork_share)
        if @artwork_share.save
            redirect_to user_url(@artwork_share.viewer)
        else
            render json: @artwork_share.errors.full_messages,status: :unprocessable_entity
        end
    end

    def destroy 
        @artwork_share = ArtworkShare.find_by(id: params[:id])
        if @artwork_share.destroy
            redirect_to user_url(@artwork_share.viewer)
        else
            render json: @artwork_share.errors.full_messages,status: :unprocessable_entity
        end
    end

    private
    def require_artwork_share
        params.require(:artwork_share).permit(:viewer_id, :artwork_id)
    end
end