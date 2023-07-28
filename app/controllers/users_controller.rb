class UsersController < ApplicationController
    # skip_before_action :verify_authenticity_token
    before_action :authenticate_user!

    def index
        @users = User.all
        render "index" 
    end

    def login
        render "login"
    end

    def new
        @user = User.new
    end

    def show
        redirect_to root_path
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to root_path, notice: 'Success!'
        else
            render :new
        end
    end

    private
    
    def user_params
        params.permit(:username, :roll)
    end
end