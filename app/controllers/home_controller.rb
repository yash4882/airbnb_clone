class HomeController < ApplicationController
    # before_action :authenticate_user!
    
    def index
        @properties = Property.all.order(created_at: :desc)
    end
end
