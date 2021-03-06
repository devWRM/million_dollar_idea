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

    def show

        @resource = Resource.find_by_id(params[:id])
        
        if @resource
            @idea = @resource.idea
        else
            flash[:message] = "That resource doesn't exist"
            redirect_to resources_path
        end
    end


    def new
        @idea = Idea.find_by_id(params[:idea_id])

        if  params[:idea_id] && @idea && current_user == @idea.user
            
            # current_user != @idea.user
            
            # @resource = Resource.new
            @resource = @idea.resources.build
           
        else
            flash[:message] = "Please select one of your ideas below to add a resource." if params[:idea_id]
            flash[:message] = "Select one of your ideas below to add a resource" if !params[:idea_id]

            # @error = "That idea doesn't exist" if params[:idea_id]
            redirect_to user_ideas_path(current_user)
            # @resource = Resource.new
        end      
    end


    def create
        # @resource = current_user.resources.build(resource_params)
        @idea = Idea.find_by_id(params[:idea_id])
        @resource = @idea.resources.build(resource_params)

        if @resource.save
            flash[:message] = "Your resource has been saved."
            redirect_to idea_resources_path(@idea)
        else
            @error = "Please enter a resource"
            render :new
        end
    end


    private

    def resource_params
        params.require(:resource).permit(:source)     # <<= Why :idea_id is needed
    end                                                         # but ideas_controller don't need user_id



end
