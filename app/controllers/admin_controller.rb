class AdminController < ApplicationController
    
    before_action :authenticate_admin!

    def view_db
    end

end
