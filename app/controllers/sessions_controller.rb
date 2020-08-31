class SessionsController < ApplicationController
    def home
        render "/sessions/index.html.erb"
    end
end