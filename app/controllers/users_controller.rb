class UsersController < ApplicationController
    # before_action :redirect_if_not_logged_in

    def index
        # categories/:id/users

        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @ideas = Idea.all
        else
            @users = User.all

        end
    end

    def show

        @user = User.find_by_id(params[:id])
        redirect_if_not_logged_in
        # redirect_to '/' if !@user
    end

    def new
        # Signup
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end




    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end


    

end
