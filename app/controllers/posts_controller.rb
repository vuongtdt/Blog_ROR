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
        @new_post = Post.new
    end

    def create
        @new_post = Post.new(create_post_params)
        @new_post.user_id = current_user.id
        if @new_post.save
            redirect_to posts_path, notice: 'Created post successfully!'
        else
            render :new
        end
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
    end

    def create_post_params
        params.require(:post).permit(:title, :body, status)
    end

    def post_params
        params.require(:post).permit(:id, :title, :body, :status)
    end
end