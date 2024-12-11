module Owner
	class ReservationsController < ApplicationController
		 before_action :authenticate_user!
		 # TODO: show letest first
		def index
			@reservations = current_user.properties.map(&:reservations).flatten
		end
	end
end