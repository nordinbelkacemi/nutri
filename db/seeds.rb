puts "creating users..."
User.create(email: "nordinbelkacemi@gmail.com", password: "123456")

puts "creating nutritionists..."
Nutritionist.create(name: "test")

puts "creating meals..."
Meal.create(nutritionist: Nutritionist.first)

puts "creating ingredients..."
Ingredient.create(meal: Meal.first)

puts "creating reviews..."
Review.create(nutritionist: Nutritionist.first)

puts "creating certificates..."
Certificate.create(nutritionist: Nutritionist.first)

puts "creating subscriptions..."
Subscription.create(nutritionist: Nutritionist.first, user: User.first)

# Nutritionist.destroy_all
# User.destroy_all
