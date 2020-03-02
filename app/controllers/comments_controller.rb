class CommentsController < ApplicationController
    before_action :set_post
    before_action :authenticate_user!

    def create
        cp = comments_params
        cp[:user] = current_user
        @post.comments.create! cp
        redirect_to @post
    end

    private
        def set_post
            @post = Post.find(params[:post_id])
        end

        def comments_params
            params.required(:comment).permit(:body)
        end
end