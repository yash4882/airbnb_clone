# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.create({
	email: "test@gmail.com",
	password: "121212"
})

6.times do |i|
	property = Property.create!(name: "Redisson", 
		description: "Beautifully located in a small village called Tandi, a 10km serene drive/ride from Jibhi. And just 50 metre walking from the parking area. Once you are in our treehouse , you will get to see of a kind breathtaking view of the mountains.  We cook delicious traditional Himachali food as well as the food that you really want to have it here at our treehouse while enjoying the view.",
		headline: "Property you must visit",
		address_1: "130 vijay nagar", address_2: "behind petrol pump",
		city: "indore",
		state: "madhya pradesh",
		country: "india",
		price: Money.from_amount((10..100).to_a.sample, 'USD'),
		bedroom_count: (1..5).to_a.sample,
		guest_count: (1..20).to_a.sample,
		bed_count: (1..10).to_a.sample,
		bathroom_count: (1..4).to_a.sample,
		)

	property.images.attach(io: File.open("db/images/property_#{i+1}.png"), filename: property.name)
	property.images.attach(io: File.open("db/images/property_7.png"), filename: property.name)
	property.images.attach(io: File.open("db/images/property_8.png"), filename: property.name)
	property.images.attach(io: File.open("db/images/property_9.png"), filename: property.name)
	property.images.attach(io: File.open("db/images/property_10.png"), filename: property.name)
	property.images.attach(io: File.open("db/images/property_11.png"), filename: property.name)
	property.images.attach(io: File.open("db/images/property_12.png"), filename: property.name)

	((1..10).to_a.sample).times do
		Review.create({
			content: "this content for review", 
			cleanliness_rating: (1..5).to_a.sample, 
			accuracy_rating: (1..5).to_a.sample, 
			checking_rating: (1..5).to_a.sample, 
			communication_rating: (1..5).to_a.sample, 
			location_rating: (1..5).to_a.sample, 
			value_rating: (1..5).to_a.sample, 
			# final_rating: decimal, 
			user: user, 
			property: property
		})
	end

end