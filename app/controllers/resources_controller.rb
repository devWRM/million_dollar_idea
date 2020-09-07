class ResourcesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index

        if params[:idea_id] && @idea = Idea.find_by_id(params[:idea_id])
            @resources = @idea.resources
        else
            @error = "That idea doesn't exist" if params[:idea_id]
            @resources = Resource.all
        end

    end

    def new

        if params[:idea_id] && @idea = Idea.find_by_id(params[:idea_id])
            # @resource = Resource.new
            @resource = @idea.resources.build
           
        else
            @error = "That idea doesn't exist" if params[:idea_id]
            redirect_to ideas_path
            # @resource = Resource.new
        end      
    end

    def create
        
        # @resource = Resource.new(params[:resource][:source])
        # @user = User.find_by_id(params[:user_id])

        # @ideas = @user.ideas
        # @idea.resources << params[:resource][:source]

        if params[:idea_id] && @idea = Idea.find_by_id(params[:idea_id])   # @resource.save

            flash[:message] = "Your resource has been saved."
            Resource.create(idea_id: params[:idea_id], source: params[:resource][:source])
            # @idea.resources << params[:resource][:source]
            redirect_to resources_path(@idea)
        else
            # ?? Should be error message ??
            flash[:message] = "Please try again."
            render :new
        end


    end



    private

    def resource_params
        params.require(:resource).permit(:source)
    end



end
