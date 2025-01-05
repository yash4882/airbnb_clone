class HomeController < ApplicationController
    # before_action :authenticate_user!
    
    def index
        @properties = Property.all.order(created_at: :desc).page(params[:page]).per(10)
    end
end
