Nutritionist.destroy_all
User.destroy_all

snacks = [
  "Apple slices with almond butter",
  "Avocado and Salsa on Ezekiel Toast",
  "Banana, Peanut Butter and Honey Roll-Ups",
  "Celery Sticks and Skinny Buffalo Chicken Dip",
  "Chef’s Cut Buffalo Style Chicken Jerky"
]

bios = [
  "General twitter fanatic. Subtly charming pop culture advocate. Internet trailblazer.",
  "General creator. Thinker. Coffee guru. Social media junkie. Unapologetic alcohol maven.",
  "Hardcore thinker. Hipster-friendly student. Certified writer. Typical problem solver. Musicaholic. Reader.",
  "Avid coffee expert. Writer. Reader. Internet nerd. Pop culture guru. Tvaholic. Travel fan. Beer evangelist.",
  "Beer advocate. Award-winning gamer. Amateur alcohol geek. Internet ninja. Hardcore thinker.",
  "Amateur coffee guru. Alcohol trailblazer. Typical pop culture ninja. Foodaholic. Music fan. Total web geek. Twitter buff. Internet nerd.",
  "Food trailblazer. Troublemaker. Zombie scholar. Devoted analyst. Twitter buff. General alcohol guru. Evil coffee lover.",
  "Unapologetic tv aficionado. Extreme beer fan. Hipster-friendly twitter evangelist. Total writer."
]

puts "creating users..."
User.create(email: "kojoaddaquay@gmail.com", password: "123456")
User.create(email: "nordinbelkacemi@gmail.com", password: "123456")
User.create(email: "celine.te.mcgill@gmail.com", password: "123456")

puts "creating nutritionists..."
8.times do |i|
  Nutritionist.create(name: "Dr. #{Faker::FunnyName.three_word_name}", bio: bios[i])
end

puts "creating meals..."
5.times do |i|
  Meal.create(
    name: Faker::Food.dish,
    nutritionist: Nutritionist.first,
    type: "breakfast",
    calories: rand(200..500)
  )
end

5.times do |i|
  Meal.create(
    name: Faker::Food.dish,
    nutritionist: Nutritionist.first,
    type: "lunch",
    calories: rand(500..800)
  )
end

5.times do |i|
  Meal.create(
    name: Faker::Food.dish,
    nutritionist: Nutritionist.first,
    type: "dinner",
    calories: rand(500..800)
  )
end

5.times do |i|
  Meal.create(
    name: snacks[i],
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
