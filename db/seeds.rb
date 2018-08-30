require_relative "constants"
require "faraday"

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

request_url = "https://api.edamam.com/search?q=salad&app_id=#{ENV['EDAMAM_APP_ID']}&app_key=#{ENV['EDAMAM_API_KEY']}&q="
queries = ["breakfast", "lunch", "dinner", "snacks"]

puts "creating breakfast..."
response = Faraday.get request_url + "beans"
recipes = JSON.parse(response.body)["hits"]

for i in 0...4
  recipe = recipes[i]["recipe"]

  meal = Meal.create!(
    name: recipe["label"],
    nutritionist: Nutritionist.first,
    type: "breakfast",
    calories: recipe["calories"].floor,
    remote_photo_url: recipe["image"],
    recipe: "Stir together tuna, mayonnaise, green onions, red pepper, and balsamic vinegar in a bowl. Season with pepper and garlic salt, then pack the avocado halves with the tuna mixture. Garnish with reserved green onions and a dash of black pepper before serving.",
    fat: recipe["totalNutrients"]["FAT"]["quantity"].floor,
    carbs: recipe["totalNutrients"]["CHOCDF"]["quantity"].floor,
    protein: recipe["totalNutrients"]["PROCNT"]["quantity"].floor,
    healthLabels: recipe["healthLabels"],
    yield: recipe["yield"]

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
response = Faraday.get request_url + "wrap"
recipes = JSON.parse(response.body)["hits"]

for i in 0...5
  recipe = recipes[i]["recipe"]

  meal = Meal.create!(
    name: recipe["label"],
    nutritionist: Nutritionist.first,
    type: "lunch",
    calories: recipe["calories"].floor,
    remote_photo_url: recipe["image"],
    fat: recipe["totalNutrients"]["FAT"]["quantity"].floor,
    carbs: recipe["totalNutrients"]["CHOCDF"]["quantity"].floor,
    protein: recipe["totalNutrients"]["PROCNT"]["quantity"].floor,
    healthLabels: recipe["healthLabels"],
    yield: recipe["yield"]
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
response = Faraday.get request_url + "soup"
recipes = JSON.parse(response.body)["hits"]

for i in 0...5
  recipe = recipes[i]["recipe"]

  meal = Meal.create!(
    name: recipe["label"],
    nutritionist: Nutritionist.first,
    type: "dinner",
    calories: recipe["calories"].floor,
    remote_photo_url: recipe["image"],
    fat: recipe["totalNutrients"]["FAT"]["quantity"].floor,
    carbs: recipe["totalNutrients"]["CHOCDF"]["quantity"].floor,
    protein: recipe["totalNutrients"]["PROCNT"]["quantity"].floor,
    healthLabels: recipe["healthLabels"],
    yield: recipe["yield"]
  )
  recipe["ingredients"].each do |ingredient|
    Ingredient.create!(
      meal: meal,
      name: ingredient["text"]
    )
  end
end

puts "creating snacks..."
response = Faraday.get request_url + "vegetables"
recipes = JSON.parse(response.body)["hits"]

for i in 0...5
  recipe = recipes[i]["recipe"]

  meal = Meal.create!(
    name: recipe["label"],
    nutritionist: Nutritionist.first,
    type: "snack",
    calories: recipe["calories"].floor,
    remote_photo_url: recipe["image"],
    fat: recipe["totalNutrients"]["FAT"]["quantity"].floor,
    carbs: recipe["totalNutrients"]["CHOCDF"]["quantity"].floor,
    protein: recipe["totalNutrients"]["PROCNT"]["quantity"].floor,
    healthLabels: recipe["healthLabels"],
    yield: recipe["yield"]
  )
  recipe["ingredients"].each do |ingredient|
    Ingredient.create!(
      meal: meal,
      name: ingredient["text"]
    )
  end
end

#Custom Snack for demo

#Custom Dinner for demo
meal = Meal.create!(
    name: "The Krabby Patty",
    nutritionist: Nutritionist.first,
    type: "dinner",
    description: "The Krabby Patty is a popular burger served at the Krusty Krab. It is the best-known food at the restaurant and the most famous burger in Bikini Bottom.",
    calories: 208,
    remote_photo_url: "https://images.unsplash.com/photo-1504185945330-7a3ca1380535?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9f2d35c4ea30a81e428e66c653748f91&auto=format&fit=crop&w=921&q=80",
    recipe: L_DIRECTIONS,
    fat: 11,
    carbs: 20,
    protein: 30,
    healthLabels: [ "Vegan", "Gluten-Free"],
    yield: 3

  )

D_INGREDIENTS.each do |ingredient|
    Ingredient.create!(
      meal: meal,
      name: ingredient
    )
  end

#Custom Lunch for Demo
meal = Meal.create!(
    name: "Karate Noodles",
    nutritionist: Nutritionist.first,
    type: "lunch",
    description: "This meal is sure to give you a kick. A Jackie Chan favorite, this simple dish can prepared without breaking a sweat.",
    calories: 208,
    remote_photo_url: "https://images.unsplash.com/photo-1516901121982-4ba280115a36?ixlib=rb-0.3.5&s=9180f3f2e3ed953417da83565fc41849&auto=format&fit=crop&w=2851&q=80",
    recipe: L_DIRECTIONS,
    fat: 12,
    carbs: 20,
    protein: 7,
    healthLabels: [ "Vegan", "Gluten-Free"],
    yield: 6

  )

L_INGREDIENTS.each do |ingredient|
    Ingredient.create!(
      meal: meal,
      name: ingredient
    )
  end

#Custom Breakfast for demo
meal = Meal.create!(
    name: "Salmon of the Caribbean",
    nutritionist: Nutritionist.first,
    type: "breakfast",
    description: "You don't have to be a jolly sailor to experience this tropical delight. Captain Jack Sparrow always packs this on his quests.",
    calories: 362,
    remote_photo_url: "https://images.unsplash.com/photo-1523986371872-9d3ba2e2a389?ixlib=rb-0.3.5&s=7ef3a363700a68cb580cf69fdfbd3c26&auto=format&fit=crop&w=1950&q=80",
    recipe: B_DIRECTIONS,
    fat: 42,
    carbs: 9,
    protein: 26,
    healthLabels: ["Halal", "Kosher", "Pescatarian"],
    yield: 2

  )

B_INGREDIENTS.each do |ingredient|
    Ingredient.create!(
      meal: meal,
      name: ingredient
    )
  end

puts "creating meal plans ;)"

celine_meal_plan = MealPlan.create!(user: User.first, name: "Yoga Day")
3.times do |i|
  MealPlanMeal.create!(meal: Meal.all.sample, meal_plan: celine_meal_plan)
end

  celine_meal_plan = MealPlan.create!(user: User.first, name: "Workout Day")
3.times do |i|
  MealPlanMeal.create!(meal: Meal.all.sample, meal_plan: celine_meal_plan)
end

  celine_meal_plan = MealPlan.create!(user: User.first, name: "Rest Day")
3.times do |i|
  MealPlanMeal.create!(meal: Meal.all.sample, meal_plan: celine_meal_plan)
end

Subscription.create!(user: User.first, nutritionist: Nutritionist.first)
Subscription.create!(user: User.first, nutritionist: Nutritionist.second)
Subscription.create!(user: User.first, nutritionist: Nutritionist.third)

Subscription.create!(user: User.second, nutritionist: Nutritionist.first)
Subscription.create!(user: User.second, nutritionist: Nutritionist.second)
Subscription.create!(user: User.second, nutritionist: Nutritionist.third)

Subscription.create!(user: User.third, nutritionist: Nutritionist.first)
Subscription.create!(user: User.third, nutritionist: Nutritionist.second)
Subscription.create!(user: User.third, nutritionist: Nutritionist.third)

Meal.create!(
  nutritionist: Nutritionist.second,
  prep_time: (rand * 10).round,
  calories: 850,
  yield: 2,
  name: "test meal",
  type: "Dinner",
  remote_photo_url: "https://images.unsplash.com/photo-1505576399279-565b52d4ac71?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=fb2e66d3d3bf1c413f143e9a723c5309&auto=format&fit=crop&w=668&q=80",
)
Meal.create!(
  nutritionist: Nutritionist.third,
  prep_time: (rand * 10).round,
  calories: 600,
  yield: 4,
  name: "test meal",
  type: "Lunch",
  remote_photo_url: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=67fb2e7b1fbe39b18b51146234ef38aa&auto=format&fit=crop&w=1500&q=80",
)
