class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :new, :create, :update, :destroy, :show]
    def index
        @posts = current_user.posts
        @user = current_user
        render 'posts/index'
    end

    def show
        @post
        render 'show'
    end

    def new
        @post = current_user.posts.build
    end

    def create
        # debugger
        puts current_user.id
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to posts_path, notice: 'Created post successfully!'
        else
            render :new
        end
    end

    def edit
    end

    def update
        # debugger
        if @post.update(post_params)
            redirect_to posts_path, notice: 'Post was successfully updated!'
        else
            render :edit
        end
    end
    
    def destroy
        @post.destroy
        respond_to do |format|
            format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :body, :status)
    end
end