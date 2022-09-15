class ArtworksController < ApplicationController
    def create
        @artwork = Artwork.new(require_artwork)
        if @artwork.save
            render json: @artwork
        else
            render jdons:@artwork.errors.full_messages,status: :unprocessable_entity
        end
    end

    def destroy 
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork.destroy
            render json: @artwork["deleted"]
        end
    end

    def show
        @artwork = Artwork.find_by(id: params[:id])
        render json: @artwork
    end

    def index
        render json: Artwork.all
    end

    def update
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork.update(require_artwork)
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end   

    private
    def require_artwork
        params.require(:artwork).permit(:title, :artist_id)
    end
end