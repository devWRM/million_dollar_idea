class CategoriesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index

        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @categories = @user.categories.uniq
        else
            @error = "That user doesn't exist" if params[:user_id]
            @categories = Category.all
        end

    end


end
