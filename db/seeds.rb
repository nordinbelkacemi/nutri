require_relative "constants"

Nutritionist.destroy_all
User.destroy_all

puts "creating users..."

User.create(
  email: "celine.te.mcgill@gmail.com",
  password: "123123",
  remote_photo_url: "https://avatars1.githubusercontent.com/u/30133098?v=4"
)

User.create(
  email: "kojoaddaquay@gmail.com",
  password: "123123",
  remote_photo_url: "https://avatars2.githubusercontent.com/u/6564773?v=4"
)

User.create(
  email: "belkaceminordin@gmail.com",
  password: "123123",
  remote_photo_url: "https://avatars3.githubusercontent.com/u/38872998?v=4"
)

puts "creating nutritionists..."
8.times do |i|
  Nutritionist.create(name: "Dr. #{Faker::FunnyName.three_word_name}",
    bio: BIOS[i],
    specialty: SPECIALTIES.sample,
    remote_photo_url: NUTRITIONISTS_PHOTOS[i]
  )
end

puts "creating meals..."
puts "  breakfast..."
5.times do |i|
  Meal.create(
    name: Faker::Food.dish,
    nutritionist: Nutritionist.first,
    type: "breakfast",
    calories: rand(200..500)
  )
end

puts "  lunch..."
5.times do |i|
  Meal.create(
    name: Faker::Food.dish,
    nutritionist: Nutritionist.first,
    type: "lunch",
    calories: rand(500..800)
  )
end

puts "  dinner..."
5.times do |i|
  Meal.create(
    name: Faker::Food.dish,
    nutritionist: Nutritionist.first,
    type: "dinner",
    calories: rand(500..800)
  )
end

puts "  snacks..."
5.times do |i|
  Meal.create(
    name: SNACKS[i],
    nutritionist: Nutritionist.first,
    type: "Snack",
    calories: rand(50..300)
  )
end

puts "creating ingredients..."
Ingredient.create(meal: Meal.first)

puts "creating reviews..."
Review.create(nutritionist: Nutritionist.first)

puts "creating certificates..."
Certificate.create(nutritionist: Nutritionist.first)

puts "creating subscriptions..."
Subscription.create(nutritionist: Nutritionist.first, user: User.first)
