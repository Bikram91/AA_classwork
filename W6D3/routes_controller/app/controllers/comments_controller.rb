class CommentsController < ApplicationController
    def create
        @comment = Comment.new(require_comment)
        if @comment.save
            render json: @comment
        else
            render jsons: @comment.errors.full_messages,status: :unprocessable_entity
        end
    end

    def destroy 
        @comment = Comment.find_by(id: params[:id])
        if @comment.destroy
            render json: @comment["deleted"]
        end
    end

    def index
        render json: Comment.comments_for_user_id(params[:user_id])
    end

    private
    def require_comment
        params.require(:comment).permit(:body, :author_id, :artwork_id)
    end

end