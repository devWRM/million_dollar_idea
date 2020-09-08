
FILE resources_controller.rb

def create
        @idea = Idea.find_by_id(params[:idea_id])
        @resource = @idea.resources.build(resource_params)

        
        if params[:resource][:source].empty? || !@resource.save
            @error = "Please enter a resource"
            render :new
        else

             @resource.save
            flash[:message] = "Your resource has been saved."
            redirect_to idea_resources_path(@idea)
        end
    end




==================================================

ORIGINAL resources_controllers.rb (create action)
     def create
        
         # @resource = Resource.new(params[:resource][:source])
         # @user = User.find_by_id(params[:user_id])

         # @ideas = @user.ideas
         # @idea.resources << params[:resource][:source]

         # if params[:resource][:source].empty?
         #     @error = "Please enter a resource"
         #     render :new
         # end

         if params[:idea_id] && @idea = Idea.find_by_id(params[:idea_id])   # @resource.save

             flash[:message] = "Your resource has been saved."

             # Resource.create(idea_id: params[:idea_id], source: params[:resource][:source])
             # Resource.create(resource_params)
             # @idea.resources << params[:resource][:source]
             redirect_to resources_path(@idea)
         else
             # ?? Should be error message ??
             flash[:message] = "Please try again."
             render :new
         end


     end
