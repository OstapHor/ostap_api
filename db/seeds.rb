# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Фейкер для моделей User, Realtor, Property, Contract, Rating

# Спочатку створимо фейкових користувачів
5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    rating: Faker::Number.between(from: 1, to: 5)
  )
end

# Потім створимо фейкових рієлторів
5.times do
  Realtor.create!(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    rating: Faker::Number.between(from: 1, to: 5),
    contactinfo: Faker::PhoneNumber.phone_number
  )
end

# Далі створимо фейкові властивості
5.times do
  Property.create!(
    property_type: ["Apartment", "House", "Condo", "Townhouse"].sample,
    location: Faker::Address.full_address,
    price: Faker::Commerce.price(range: 100000.0..500000.0)
  )
end

# Потім створимо фейкові контракти
User.all.each do |user|
  Property.all.each do |property|
    Realtor.all.each do |realtor|
      Contract.create!(
        user: user,
        property: property,
        realtor: realtor,
        details: Faker::Lorem.sentence
      )
    end
  end
end

# Нарешті створимо фейкові рейтинги
User.all.each do |user|
  Property.all.each do |property|
    Realtor.all.each do |realtor|
      Rating.create!(
        user: user,
        property: property,
        realtor: realtor,
        final_rating: Faker::Number.between(from: 1, to: 5),
        infrastructure_rating: Faker::Number.between(from: 1, to: 5),
        location_to_city_center_rating: Faker::Number.between(from: 1, to: 5),
        maintenance_rating: Faker::Number.between(from: 1, to: 5),
        neighborhood_rating: Faker::Number.between(from: 1, to: 5),
        security_rating: Faker::Number.between(from: 1, to: 5)
      )
    end
  end
end
