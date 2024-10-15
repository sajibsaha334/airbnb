require 'open-uri'

description = <<-DESCRIPTION
<div>Explore the nature and art oasis at our unique property. The living room, a cozy masterpiece, and the fully equipped kitchen are ideal for cooking and entertaining. Step outside to our garden patio, unwind, and enjoy morning birdsong. Tastefully decorated bedrooms, a powder room, and utility area complete the experience.<br />Note: The property is surrounded by a residential area. Despite initial surroundings, I am sure that, stepping in will fill your mood with joy and happiness.
</div>
<h4 class="font-medium" tabindex="-1">The space</h4>
<p>Escape to a hidden gem in the heart of nature with our beautiful and artistic property. Our spacious and welcoming home is the perfect retreat for those looking to escape the hustle and bustle of the city and reconnect with nature.<br />As you enter through our beautifully adorned main gate with mandala art, you'll immediately feel a sense of peace and positive energy. The gate is an entryway to an amazing experience that is designed to help you unwind and relax.<br />Our living room is a work of art, with fascinating elements that create a cozy and unforgettable ambiance. The room features artistic designs, which are evident in the use of color, the decorations on the wall, and the unique furniture arrangement. The artistic flair adds a unique touch of elegance to the living room, making it the perfect place to spend time with family and friends. Our fully equipped kitchen is a modern open design with bamboo roofing, perfect for cooking and entertaining guests.<br />Step outside and experience the beauty of our garden patio, complete with a lush green view and the calming sounds of chirping birds in the morning. The patio is an extension of the living room, where you can enjoy your meals and relax in the fresh air. Fire up the barbecue in our cozy gazebo for a fun and relaxing evening with friends and family. The garden patio is the perfect place to unwind, read a book or just take a nap under the shade of a tree.<br />The bedrooms are spacious, comfortable, and tastefully decorated, with plenty of natural light, beautiful art pieces and a calming color scheme. The beds are comfortable, and the linens are soft and luxurious, providing you with the best possible sleeping experience.<br />Even our powder room and utility area have been designed with sustainability in mind. The utility area is a cleverly designed space that is efficient and has all the modern amenities required for your stay.<br />Note: The property is surrounded by a residential area. Despite initial surroundings, I am sure that, stepping in will fill your mood with joy and happiness.</p>
<h4 class="font-medium" tabindex="-1">Guest Policy</h4>
<p>Entire Property is yours!! Wish you fun and happy stay!!</p>
DESCRIPTION

amenity1 = Amenity.create!(name: 'Kitchen')
amenity1.icon.attach(io: File.open("app/assets/images/amenity_icons/kitchen.svg"), filename: amenity1.name)

amenity2 = Amenity.create!(name: 'Private pool')
amenity2.icon.attach(io: File.open("app/assets/images/amenity_icons/private_pool.svg"), filename: amenity2.name)

amenity3 = Amenity.create!(name: 'Wifi')
amenity3.icon.attach(io: File.open("app/assets/images/amenity_icons/wifi.svg"), filename: amenity3.name)

amenity4 = Amenity.create!(name: 'Esssentials', description: 'Towels, bed sheets, soap and toilet paper')
amenity4.icon.attach(io: File.open("app/assets/images/amenity_icons/essentials.svg"), filename: amenity4.name)

pictures = []
20.times do
  pictures << URI.open(Faker::LoremFlickr.image)
end

user = User.create!({
  email: 'test123@gmail.com',
  password: 'password',
  name: Faker::Lorem.unique.sentence(word_count: 3),
  address_1: Faker::Address.street_address,
  address_2: Faker::Address.street_name,
  city: Faker::Address.city,
  state: Faker::Address.state,
  country: Faker::Address.country,
})

user.picture.attach(io: pictures[0], filename: user.name)

19.times do |i|
  random_user = User.create!({
    email: "test#{i + 1}@gmail.com",
    password: '123456',
    name: Faker::Lorem.unique.sentence(word_count: 3),
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
  })
  random_user.picture.attach(io: pictures[i+1], filename: user.name)
end


10.times do |i|
  property = Property.create!({
    name: Faker::Lorem.unique.sentence(word_count: 3),
    description: description,
    headline: Faker::Lorem.unique.sentence(word_count: 6),
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    price: Money.from_amount(50, 'USD'),
    bedroom_count: (2..5).to_a.sample,
    bed_count: (4..10).to_a.sample,
    guest_count: (5..20).to_a.sample,
    bathroom_count: (1..5).to_a.sample
  })

  property.images.attach(io: File.open("db/images/property#{i+1}.webp"), filename: property.name)
  property.images.attach(io: File.open("db/images/property#{i+10}.webp"), filename: property.name)
  property.images.attach(io: File.open("db/images/property5.webp"), filename: property.name)
  property.images.attach(io: File.open("db/images/property6.webp"), filename: property.name)
  property.images.attach(io: File.open("db/images/property7.webp"), filename: property.name)
  property.images.attach(io: File.open("db/images/property8.webp"), filename: property.name)
  property.images.attach(io: File.open("db/images/property9.webp"), filename: property.name)

  ((5..10).to_a.sample).times do
    Review.create!({
      content: Faker::Lorem.paragraph(sentence_count: 10),
      cleaniness_rating: (1..5).to_a.sample,
      accuracy_rating: (1..5).to_a.sample,
      checkin_rating: (1..5).to_a.sample,
      communication_rating: (1..5).to_a.sample,
      location_rating: (1..5).to_a.sample,
      value_rating: (1..5).to_a.sample,
      property: property,
      user: User.all.sample
    })
  end
end
