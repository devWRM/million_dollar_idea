class UsersController < ApplicationController

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
