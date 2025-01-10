class ReviewsController < ApplicationController
    before_action :set_reservation, only: [:new, :create]

    def create
        # TODO: Visit this URL directly and check that if a review has already been added, it shows 404 or redirects back.
        @review = current_user.reviews.new(
            review_params.merge(
                property_id: @reservation.property_id,
                reservation_id: @reservation.id
            )
        )

        if @review.save
            redirect_to root_path, notice: 'Review added successfully'
        else
            redirect_back fallback_location: root_path, alert: 'Failed to add review'
        end
    end

    private

    def set_reservation
        @reservation = Reservation.find(params[:reservation_id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path, alert: 'Reservation not found'
    end

    def review_params
        params.permit(
            :content,
            :cleanliness_rating,
            :accuracy_rating,
            :checking_rating,
            :communication_rating,
            :location_rating,
            :value_rating 
        )
    end
end
