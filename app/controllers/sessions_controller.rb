class SessionsController < ApplicationController
    def home

        # Welcome
    end

    def new
        # Login
    end

    def create
     
        user = User.find_by(email: params[:user][:email])

        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
            # redirect_to "/users/#{user.id}"
        else
            flash[:message] = "Received invalid login information. Please try again."
            redirect_to login_path
        end
    end

    def destroy
        # Logout
        session.clear
        redirect_to root_path
    end

    




end

