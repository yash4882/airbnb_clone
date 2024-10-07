# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


6.times do |i|
	property = Property.create!(name: "Redisson", 
		description: "this is property from airbnb",
		headline: "Property you must visit",
		address_1: "130 vijay nagar", address_2: "behind petrol pump",
		city: "indore",
		state: "madhya pradesh",
		country: "india",
		price: Money.from_amount((10..100).to_a.sample, 'USD'))

	property.images.attach(io: File.open("db/images/property_#{i+1}.png"), filename: property.name)
	property.images.attach(io: File.open("db/images/property_#{i+7}.png"), filename: property.name)
end