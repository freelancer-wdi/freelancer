class HomeController < ApplicationController
    def index
        if programmer_signed_in?
            redirect_to offers_path
        elsif customer_signed_in?
            redirect_to projects_path
        end
    end
end