module Owner
	class PropertiesController < ApplicationController
		before_action :authenticate_user!
		before_action :set_property, only: [:edit, :update, :update_amenities, :remove_image, :add_images, :destroy]


		def index
			@properties = current_user.properties
		end

		def new
			@property = Property.new
		end

		def create
			@property = current_user.properties.new(property_params)
			if @property.save
				redirect_to owner_properties_path, notice: 'Property added successfully'
			else
				redirect_back fallback_location: new_owner_property_path, alert: 'Failed to add property'
			end
		end

		def update
			if @property.update!(property_params)
		      	redirect_to edit_owner_property_path, notice: 'Property updated successfully'
		    else
		      	redirect_back fallback_location: edit_owner_property_path, alert: 'Failed to update property'
		    end
		end

		def update_amenities
			if @property.update!(amenities_params)
		      	redirect_to edit_owner_property_path, notice: 'Amenities updated successfully'
		    else
		      	redirect_back fallback_location: edit_owner_property_path, alert: 'Failed to update property amenities'
		    end
		end

		def remove_image
			image = @property.images.find(params[:image_id])
			if image.destroy
		      	redirect_to edit_owner_property_path, notice: 'Image removed successfully'
		    else
		      	redirect_back fallback_location: edit_owner_property_path, alert: 'Failed to remove images'
		    end
		end

		def add_images
			@property.images.attach(params[:property][:images])
	    	redirect_to edit_owner_property_path, notice: 'Images uploaded successfully'
		end

		def destroy
			@property.destroy
			redirect_to owner_properties_path, notice: 'Property removed successfully'
		end

		private

		def set_property
			@property = current_user.properties.find(params[:id])
		end

		def amenities_params
			params.require(:property).permit(:amenity_ids => [])
		end

		def property_params
			params.require(:property).permit(
				:name,
				:headline,
				:description,
				:price,
				:bedroom_count,
				:bed_count,
				:bathroom_count,
				:guest_count,
				:address_1,
				:address_2,
				:city,
				:state,
				:country_code
			)
		end
	end
end