
rails routes
localhost:3000/rails/info/routes

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
FILE app/controllers/users_controller.rb
IN THE create action

    Signup creates a new user:
        @user = User.new(user_params)
        if @user.save

    When new user signs up, log in by assigning session key:
        session[:user_id] = @user.id

FILE app/controllers/sessions_controller.rb
IN THE destroy action
    Logout by deleting the session's user_id:
        session.clear

=======================================================

