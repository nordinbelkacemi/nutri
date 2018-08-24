require_relative "constants"
require "faraday"
require "pry-byebug"

Nutritionist.destroy_all
User.destroy_all

puts "creating users..."

User.create!(
  email: "celine.te.mcgill@gmail.com",
  password: "123123",
  remote_photo_url: "https://avatars1.githubusercontent.com/u/30133098?v=4"
)

User.create!(
  email: "kojoaddaquay@gmail.com",
  password: "123123",
  remote_photo_url: "https://avatars2.githubusercontent.com/u/6564773?v=4"
)

User.create!(
  email: "belkaceminordin@gmail.com",
  password: "123123",
  remote_photo_url: "https://avatars3.githubusercontent.com/u/38872998?v=4"
)

puts "creating nutritionists..."
8.times do |i|
  Nutritionist.create!(name: "Dr. #{Faker::FunnyName.three_word_name}",
    bio: BIOS[i],
    specialty: SPECIALTIES.sample,
    remote_photo_url: NUTRITIONISTS_PHOTOS[i]
  )
end

####### meals with api
puts "creating meals..."

request_url = "https://api.edamam.com/search?q=paleo&app_id=#{ENV['EDAMAM_APP_ID']}&app_key=#{ENV['EDAMAM_API_KEY']}&q="
queries = ["breakfast", "lunch", "dinner", "snacks"]

puts "creating breakfast..."
response = Faraday.get request_url + "breakfast"
recipes = JSON.parse(response.body)["hits"]

for i in 0...5
  recipe = recipes[i]["recipe"]

  meal = Meal.create!(
    name: recipe["label"],
    nutritionist: Nutritionist.first,
    type: "breakfast",
    calories: recipe["calories"].floor,
    remote_photo_url: recipe["image"],
    recipe: "Stir together tuna, mayonnaise, green onions, red pepper, and balsamic vinegar in a bowl. Season with pepper and garlic salt, then pack the avocado halves with the tuna mixture. Garnish with reserved green onions and a dash of black pepper before serving."
  )

  recipe["ingredients"].each do |ingredient|
    Ingredient.create!(
      meal: meal,
      name: ingredient["text"]
    )
  end
end
# prevent making too many requests too fast
sleep(3)

puts "creating lunch..."
response = Faraday.get request_url + "lunch"
recipes = JSON.parse(response.body)["hits"]

for i in 0...5
  recipe = recipes[i]["recipe"]

  meal = Meal.create!(
    name: recipe["label"],
    nutritionist: Nutritionist.first,
    type: "lunch",
    calories: recipe["calories"].floor,
    remote_photo_url: recipe["image"]
  )
  recipe["ingredients"].each do |ingredient|
    Ingredient.create!(
      meal: meal,
      name: ingredient["text"]
    )
  end
end

sleep(3)

puts "creating dinner..."
response = Faraday.get request_url + "dinner"
recipes = JSON.parse(response.body)["hits"]

for i in 0...5
  recipe = recipes[i]["recipe"]

  meal = Meal.create!(
    name: recipe["label"],
    nutritionist: Nutritionist.first,
    type: "dinner",
    calories: recipe["calories"].floor,
    remote_photo_url: recipe["image"]
  )
  recipe["ingredients"].each do |ingredient|
    Ingredient.create!(
      meal: meal,
      name: ingredient["text"]
    )
  end
end

puts "creating snacks..."
response = Faraday.get request_url + "snacks"
recipes = JSON.parse(response.body)["hits"]

for i in 0...5
  recipe = recipes[i]["recipe"]

  meal = Meal.create!(
    name: recipe["label"],
    nutritionist: Nutritionist.first,
    type: "snack",
    calories: recipe["calories"].floor,
    remote_photo_url: recipe["image"]
  )
  recipe["ingredients"].each do |ingredient|
    Ingredient.create!(
      meal: meal,
      name: ingredient["text"]
    )
  end
end

2.times do |i|
  celine_meal_plan = MealPlan.create!(user: User.first, name: "Celine's meal plan")
  MealPlanMeal.create!(meal: Meal.first, meal_plan: celine_meal_plan)
  MealPlanMeal.create!(meal: Meal.second, meal_plan: celine_meal_plan)
  MealPlanMeal.create!(meal: Meal.third, meal_plan: celine_meal_plan)
end


# puts "  breakfast..."
# 5.times do |i|
#   Meal.create!(
#     name: Faker::Food.dish,
#     nutritionist: Nutritionist.first,
#     type: "breakfast",
#     calories: rand(200..500),
#     remote_photo_url: MEAL_PHOTOS[i]
#   )
# end

# puts "  lunch..."
# 5.times do |i|
#   Meal.create!(
#     name: Faker::Food.dish,
#     nutritionist: Nutritionist.first,
#     type: "lunch",
#     calories: rand(500..800),
#     remote_photo_url: MEAL_PHOTOS[i]
#   )
# end

# puts "  dinner..."
# 5.times do |i|
#   Meal.create!(
#     name: Faker::Food.dish,
#     nutritionist: Nutritionist.first,
#     type: "dinner",
#     calories: rand(500..800),
#     remote_photo_url: MEAL_PHOTOS[i]
#   )
# end

# puts "  snacks..."
# 5.times do |i|
#   Meal.create!(
#     name: SNACKS[i],
#     nutritionist: Nutritionist.first,
#     type: "Snack",
#     calories: rand(50..300),
#     remote_photo_url: MEAL_PHOTOS[i]
#   )
# end

############ end meals with api
