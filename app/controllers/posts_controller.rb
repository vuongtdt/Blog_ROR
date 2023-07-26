class PostsController < ActionController::Base
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all
        render 'posts/index'
    end

    def show
        render 'show'
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to posts_path, notice: 'Post was successfully updated!'
        else
            render :edit
        end
    end
    
    def destroy
        puts "Trigger destroy"
        @post.destroy
        respond_to do |format|
            format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private

    def set_post
        @post = Post.find(params[:id])
        puts @post
    end

    def post_params
        params.require(:post).permit(:title, :body, :status)
    end
end