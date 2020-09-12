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
            # So user's input will NOT re-populate
        end
    end

    def google

        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.username = auth["info"]["first_name"]
            user.password = SecureRandom.hex(10)
        end

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/'
        end
    end



    def destroy
        # Logout also:      session.delete(:user_id)
        session.clear
        redirect_to root_path
    end

    


    private

    def auth
        request.env['omniauth.auth']
    end



end

