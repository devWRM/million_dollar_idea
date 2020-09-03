class IdeasController < ApplicationController
    before_action :redirect_if_not_logged_in

# show page auto generate:
#   t.integer :budgeted_dollars_remaining
#   t.boolean :within_budget

    def show
        @idea = Idea.find_by_id(params[:id])
        redirect_to ideas_path if !@idea
    end


    def new
        @idea = Idea.new
    end

    def create
        @idea = current_user.ideas.build(idea_params)

        if @idea.save
            # redirect_to idea_path
            redirect_to ideas_path
        else
            flash[:message] = "Received"
            render :new
        end
    end





    private

    def idea_params
        params.require(:idea).permit(:title, :inspiration, :plan, :budgeted_dollars, :spent_dollars)
    end





end
