class CategoriesController < ApplicationController

    def index

        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @categories = @user.categories
        else
            @error = "That user doesn't exist" if params[:user_id]
            @categories = Category.all
        end

    end


end
