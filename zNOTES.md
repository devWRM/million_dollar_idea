
















The CATEGORIES
FILE app/view/ideas/show.html.erb
    <%= link_to "ALL Categories for Cookie Diet", idea_categories_path(@idea) %> or <%= link_to "Add a Category", new_idea_category_path(@idea) %>






<%= link_to "Idea for resource", @resource.idea %>


<% if @idea %><%= link_to "Click to add another resource", new_idea_resource_path(@idea) %>


<%= link_to "Add another resource", new_idea_resource_path(@idea) if @idea %>

<% if @idea %><%= link_to "Click to add another resource", idea_path(@idea) %><% end %>




rails routes
localhost:3000/rails/info/routes

NOTE @user.username == current_user

=======================================================
Had to adjust tables
    Took 2 financial columns out of Supports table
    Transferred them to Ideas table
        t.integer :budgeted_dollars
        t.integer :spent_dollars

    Took 2 financial columns out of Supports table
    Reserve to auto-generate on a show page
        t.integer :budgeted_dollars_remaining
        t.boolean :within_budget

    Add a cost column to the Supports table

=======================================================
NOTE Need route.rb =>>      delete '/logout' => 'sessions#delete'
                                delete          =>> mandatory use delete
                                'logout'        =>> match name of action (route.rb & form)
                                'sessions#delete'=>> match name of action in sessions controller

FILE app/views/users/show.html.erb
    Logout form transformation

    FORM ?? broken and does NOT work     <<= Should it be method='post'       

    <form action="/logout" method="delete">
        <input type="submit" value="Logout">
    </form>

    FORM TAG
    <%= form_tag("/logout", method: 'delete') do %>
        <%= submit_tag "Logout" %>
    <% end %>

    LINK TO
    <%= link_to "Logout", logout_path, method: "delete" %>
        NOTE delete is mandatory in =>>     method: "delete"

=======================================================

DIFFERENCE Between:

    .find_by_id(params[:id])
        - returns nil so add if statement
            redirect_to '/' if !@user

    .find_by(params[:id])

    .find(params[:id])
        - throws an error (breaks) so use rescue statement or error page & send to home '/' page


=======================================================
FILE app/controllers/sessions_controllers.rb

                def home
    Deleted =>>      render "/sessions/index.html.erb"
                end

    Changed from:   views/sessions/index.html.erb 
    Changed to:     views/sessions/home.html.erb
=======================================================
SIGNUP
FILE app/controllers/users_controller.rb
    FILE views/users/hew.html.erb
IN THE create action

    Signup creates a new user:
        @user = User.new(user_params)
        if @user.save

    When new user signs up, log in by assigning session key:
        session[:user_id] = @user.id

FILE app/controllers/sessions_controller.rb
IN THE destroy action
    LOGOUT by deleting the session's user_id:
        session.clear

=======================================================
LOGIN (LOGOUT above)
FILE app/controllers/sessions_controller.rb
    FILE views/sessions/new.html.erb

    <%= link_to "Log In", login_path %>
                - OR use-
    <%= link_to "Log In", '/login'>

    ORIGIONAL       <a href="/login">LOG IN</a> or <a href="/signup">SIGN UP</a>

NOTE in the create action both lead to the user's show page
    redirect_to user_path(user)
    redirect_to "/users/#{user.id}"

=======================================================

FILE app/views/ideas/show.html.erb

   <h4> See all Resources or Add a Support new_idea_support_path(@idea)</h4>
    <h4> See all Categories or Add a Goal new_idea_goal_path(@idea)</h4>

_____________
ORIGINAL
FILE app/views/resources/new.html.erb

<h1>Create a new Resource, <%= current_user.username %></h1>

<%= form_for([@idea, @resource]) do |f| %>
    <%= f.label :source %>
    <%= f.text_field :source %>
        </br></br>
    
    
    <%= f.submit "SUBMIT" %>

<% end %>

=======================================================
EXAMPLE Migration to add column to a table
rails generate migration AddTitleBodyToPost title:string

rails g migration AddIdeaIdToResource idea_id:belongs_to
=======================================================
Display an error message for:
FILE app/views/resources/new.html.erb

<% if @idea.errors.any? %>
<ul>
<% @article.errors.full_messages.each do |msg| %>
  <li><%= msg %></li>
<% end %>
</ul>
<% end %>


