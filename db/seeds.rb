require 'open-uri'

amenities_data = [
  {name: 'Air conditioning', icon: "air_conditioning.svg"},
  {name: 'Balcony', icon: "balcony.svg"},
  {name: 'Bed linen', icon: "bed_linen.svg"},
  {name: 'Board games', icon: "board_games.svg"},
  {name: 'Carbon monoxide alarm', icon: "carbon_monoxide_alarm.svg"},
  {name: 'Coffee maker', icon: "coffee_maker.svg"},
  {name: 'Cooker', icon: "cooker.svg"},
  {name: 'Cooking basics', icon: "cooking_basics.svg", description: 'Pots and pans, oil, salt and pepper'},
  {name: 'Cot', icon: "cot.svg"},
  {name: 'Dedicated workspace', icon: "dedicated_workspace.svg"},
  {name: 'Dining table', icon: "dining_table.svg"},
  {name: 'Dishes and cutlery', icon: "dishes_and_cutlery.svg", description: 'Bowls, chopsticks, plates, cups, etc.'},
  {name: 'Dishwasher', icon: "dishwasher.svg"},
  {name: 'Dryer', icon: "dryer.svg"},
  {name: 'Esssentials', icon: "essentials.svg", description: 'Towels, bed sheets, soap and toilet paper'},
  {name: 'Fire extinguisher', icon: "fire_extinguisher.svg"},
  {name: 'First aid kit', icon: "first_aid_kit.svg"},
  {name: 'Free parking', icon: "free_parking.svg"},
  {name: 'fridge', icon: "fridge.svg"},
  {name: 'Garden', icon: "garden.svg", description: 'An open space on the property usually covered in grass'},
  {name: 'Hair dryer', icon: "hair_dryer.svg"},
  {name: 'Hangers', icon: "hangers.svg"},
  {name: 'Heating', icon: "heating.svg"},
  {name: 'Hot tub', icon: "hot_tub.svg"},
  {name: 'Hot water', icon: "hot_water.svg"},
  {name: 'Iron', icon: "iron.svg"},
  {name: 'Kitchen', icon: "kitchen.svg", description: 'Space where guests can cook their own meals'},
  {name: 'Lockbox', icon: "lockbox.svg"},
  {name: 'Microwave', icon: "microwave.svg"},
  {name: 'Mountain view', icon: "mountain_view.svg"},
  {name: 'Oven', icon: "oven.svg"},
  {name: 'Pool table', icon: "pool_table.svg"},
  {name: 'Private entrance', icon: "private_entrance.svg", description: 'Separate street or building entrance'},
  {name: 'Private pool', icon: "private_pool.svg" },
  {name: 'Shampoo', icon: "shampoo.svg"},
  {name: 'Smoke alarm', icon: "smoke_alarm.svg"},
  {name: 'TV', icon: "tv.svg"},
  {name: 'Washing machine', icon: "washing_machine.svg"},
  {name: 'Wifi', icon: "wifi.svg"},
]

# amenities_data.each do |data|
#   amenity = Amenity.create!(name: data[:name], icon: data[:icon], description: data[:description])
# end

amenities_data.each do |data|
  amenity = Amenity.create!(name: data[:name], description: data[:description])
  amenity.icon.attach(io: File.open("app/assets/images/amenity_icons/#{data[:icon]}"), filename: amenity.name)
end

pictures = []

20.times do 
  pictures << URI.open(Faker::LoremFlickr.image)
end

user = User.create({
	email: "test@gmail.com",
	password: "121212",
	name: Faker::Lorem.unique.sentence(word_count: 3),
	address_1: Faker::Address.street_address,
	address_2: Faker::Address.street_name,
	city: Faker::Address.city,
	state: Faker::Address.state,
	country: Faker::Address.country
})

user.picture.attach(io: pictures[0], filename: user.name)

19.times do |i|
	random_user = User.create({
		email: "test#{i+2}@gmail.com",
		password: "121212",
		name: Faker::Lorem.unique.sentence(word_count: 3),
		address_1: Faker::Address.street_address,
		address_2: Faker::Address.street_name,
		city: Faker::Address.city,
		state: Faker::Address.state,
		country: Faker::Address.country
	})
	random_user.picture.attach(io: pictures[i + 1], filename: user.name)
end

# 6.times do |i|
# 	property = Property.create!(name: "Redisson", 
# 		description: "Beautifully located in a small village called Tandi, a 10km serene drive/ride from Jibhi. And just 50 metre walking from the parking area. Once you are in our treehouse , you will get to see of a kind breathtaking view of the mountains.  We cook delicious traditional Himachali food as well as the food that you really want to have it here at our treehouse while enjoying the view.",
# 		headline: "Property you must visit",
# 		address_1: "130 vijay nagar", address_2: "behind petrol pump",
# 		city: "indore",
# 		state: "madhya pradesh",
# 		country: "india",
# 		price: Money.from_amount((10..100).to_a.sample, 'USD'),
# 		bedroom_count: (1..5).to_a.sample,
# 		guest_count: (1..20).to_a.sample,
# 		bed_count: (1..10).to_a.sample,
# 		bathroom_count: (1..4).to_a.sample,
# 		)

6.times do |i|
	property = Property.create!({
		name: Faker::Lorem.unique.sentence(word_count: 3),
	    description: "Beautifully located in a small village called Tandi, a 10km serene drive/ride from Jibhi. And just 50 metre walking from the parking area. Once you are in our treehouse , you will get to see of a kind breathtaking view of the mountains.  We cook delicious traditional Himachali food as well as the food that you really want to have it here at our treehouse while enjoying the view.",
	    headline: Faker::Lorem.unique.sentence(word_count: 6),
	    address_1: Faker::Address.street_address,
	    address_2: Faker::Address.street_name,
	    city: Faker::Address.city,
	    state: Faker::Address.state,
	    country: Faker::Address.country,
	    price: Money.from_amount((50..100).to_a.sample, 'USD'),
	    bedroom_count: (2..5).to_a.sample,
	    bed_count: (4..10).to_a.sample,
	    guest_count: (4..20).to_a.sample,
	    bathroom_count: (1..4).to_a.sample,
  	})


	property.images.attach(io: File.open("db/images/property_#{i+1}.png"), filename: property.name)
	property.images.attach(io: File.open("db/images/property_7.png"), filename: property.name)
	property.images.attach(io: File.open("db/images/property_8.png"), filename: property.name)
	property.images.attach(io: File.open("db/images/property_9.png"), filename: property.name)
	property.images.attach(io: File.open("db/images/property_10.png"), filename: property.name)
	property.images.attach(io: File.open("db/images/property_11.png"), filename: property.name)
	property.images.attach(io: File.open("db/images/property_12.png"), filename: property.name)


	((10..(amenities_data.length() - 1)).to_a.sample).times do
		amenity = Amenity.all.sample
		unless property.amenities.exists?(amenity.id)
			property.amenities << amenity
  	end
	end

	 # amenity_set = Set.new
	 #  ((10..(amenities_data.length() - 1)).to_a.sample).times do
	 #    amenity = Amenity.all.sample
	 #    unless amenity_set.include?(amenity.id)
	 #      property.amenities << amenity
	 #      amenity_set << amenity.id
	 #    end
	 #  end
	 
	# ((1..10).to_a.sample).times do
	# 	Review.create({
	# 		content: "this content for review", 
	# 		cleanliness_rating: (1..5).to_a.sample, 
	# 		accuracy_rating: (1..5).to_a.sample, 
	# 		checking_rating: (1..5).to_a.sample, 
	# 		communication_rating: (1..5).to_a.sample, 
	# 		location_rating: (1..5).to_a.sample, 
	# 		value_rating: (1..5).to_a.sample, 
	# 		# final_rating: decimal, 
	# 		user: User.all.sample, 
	# 		property: property
	# 	})
	# end

	((5..10).to_a.sample).times do
	    Review.create!({
	    	content: Faker::Lorem.paragraph(sentence_count: 10),
	      	cleanliness_rating: (1..5).to_a.sample,
	      	accuracy_rating: (1..5).to_a.sample,
	      	checking_rating: (1..5).to_a.sample,
	      	communication_rating: (1..5).to_a.sample,
	      	location_rating: (1..5).to_a.sample,
	      	value_rating: (1..5).to_a.sample,
	      	property: property,
	      	user: User.all.sample
	    })
  	end
end