class IdeasController < ApplicationController
    before_action :redirect_if_not_logged_in

# show page auto generate:
#   t.integer :budgeted_dollars_remaining
#   t.boolean :within_budget


    def index       
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @ideas = @user.ideas
        else
            @error = "That user doesn't exist" if params[:user_id]
            @ideas = Idea.all.alpha.reverse
        end
    end

    def show
        @idea = Idea.find_by_id(params[:id])
        flash[:message] = "That idea doesn't exist" if !@idea

        redirect_to ideas_path if !@idea
    end


    def new
        @idea = Idea.new
    end

    def create
        @idea = current_user.ideas.build(idea_params)
        if @idea && @idea.save
            # redirect_to idea_path
            redirect_to user_ideas_path(current_user)
        else
            # flash[:message] = "Received invalid input, please try again."
            render :new
        end
    end


    def edit
        @idea = Idea.find_by_id(params[:id])
        redirect_to user_ideas_path(current_user) if !@idea || @idea.user != current_user
    end

    def update
        @idea = Idea.find_by_id(params[:id])
        redirect_to user_ideas_path(current_user) if !@idea || @idea.user != current_user
        
        if @idea.update(idea_params)
            redirect_to idea_path(@idea)
        else
            # @error = "Received invalid input. Please try again."
            render :edit
        end
    end

    def destroy
     
        # session.delete(:user_id)
        @idea = Idea.find_by_id(params[:id])

        @idea.destroy if @idea.user == current_user
        redirect_to user_ideas_path(current_user)
    end




    private

    def idea_params
        params.require(:idea).permit(:title, :inspiration, :plan, :budgeted_dollars, :spent_dollars)
    end





end
