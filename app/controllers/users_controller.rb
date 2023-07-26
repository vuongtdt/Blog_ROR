class UsersController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def index
        @users = User.all
        render "index" 
    end

    def new
        @user = User.new
    end

    def create
        debugger
        @user = User.new(user_params)
        if @user.save
            redirect_to root_path, notice: 'Success!'
        else
            render :new
        end
    end

    private
    
    def user_params
        debugger
        params.permit(:username, :roll)
    end
end