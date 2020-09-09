
FILE resources_controller.rb
Morgan explained when to us .find -vs- .find_by_id
@resource = Resource.find(params[:id])
@idea = @resource.idea

===========================

WHY resources_controller need idea_id 
BUT ideas_controller does Not need user_id ?


    <% if !@idea %>
        <%= f.label :idea %>
        <%= f.collection_select :idea_id, Idea.all, :id, :title %>
    <% end %>
