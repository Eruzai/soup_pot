# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

puts "Starting Seed Data Generation"

## Create User Data

puts "Creating Users..."

@admin1 = User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Charlie', last_name: 'Hansworth', email: 'test1@email.com', password: 'password', password_confirmation: 'password')
@admin2 = User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Kira', last_name: 'Underhill', email: 'test2@email.com', password: 'password', password_confirmation: 'password')
@admin3 = User.create!(profile_img: open_asset('default-profile.png'), first_name: 'James', last_name: 'Underhill', email: 'test3@email.com', password: 'password', password_confirmation: 'password')
@admin4 = User.create!(profile_img: open_asset('default-profile.png'), first_name: 'James', last_name: 'Bond', email: 'test4@email.com', password: 'password', password_confirmation: 'password')
@admin5 = User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Clark', last_name: 'Kent', email: 'test5@email.com', password: 'password', password_confirmation: 'password')
User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Jonathan', last_name: 'Kent', email: 'test6@email.com', password: 'password', password_confirmation: 'password')
User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Lizzy', last_name: 'Branson', email: 'test7@email.com', password: 'password', password_confirmation: 'password')
User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Emily', last_name: 'Branson', email: 'test8@email.com', password: 'password', password_confirmation: 'password')
User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Horton', last_name: 'Hears', email: 'test9@email.com', password: 'password', password_confirmation: 'password')
User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Rebecca', last_name: 'Nona', email: 'test10@email.com', password: 'password', password_confirmation: 'password')
User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Gomez', last_name: 'Capri', email: 'test11@email.com', password: 'password', password_confirmation: 'password')
User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Arjen', last_name: 'Bandi', email: 'test12@email.com', password: 'password', password_confirmation: 'password')
User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Brad', last_name: 'Hensby', email: 'test13@email.com', password: 'password', password_confirmation: 'password')
User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Chuck', last_name: 'Gorchuck', email: 'test14@email.com', password: 'password', password_confirmation: 'password')
User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Bruce', last_name: 'Wayne', email: 'test15@email.com', password: 'password', password_confirmation: 'password')
User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Ash', last_name: 'Ketchum', email: 'test16@email.com', password: 'password', password_confirmation: 'password')
User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Elvis', last_name: 'Presly', email: 'tes17t@email.com', password: 'password', password_confirmation: 'password')
User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Greg', last_name: 'Drinkwater', email: 'test18@email.com', password: 'password', password_confirmation: 'password')
User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Molly', last_name: 'Pond', email: 'test19@email.com', password: 'password', password_confirmation: 'password')
User.create!(profile_img: open_asset('default-profile.png'), first_name: 'Maria', last_name: 'Gorchuck', email: 'test20@email.com', password: 'password', password_confirmation: 'password')

puts "Users Created!"

## Create Events

puts "Creating Events..."

@admin1.events.create!(name: 'Soup Party!', start_time: '2024-07-16', description:'Please bring crackers! Starts at 5PM', private: true)
@admin1.events.create!(name: 'Pot Luck!', start_time: '2024-07-28', description:'We start with water and end up with soup! Bring something for the pot', private: false)
@admin1.events.create!(name: 'Emptying my Fridge!', start_time: '2024-08-05', description:'I have food nearing expiry! help me use it!', private: false)
@admin3.events.create!(name: 'Time to Soup!', start_time: '2024-07-16',description:"It's soup time!", private: false)
@admin3.events.create!(name: 'Can I have some More?', start_time: '2024-07-23',description:'Seconds are allowed! starts at 6PM', private: true)
@admin2.events.create!(name: 'Soup Event!', start_time: '2024-08-01',description:'THE PREMIER SOUP EVENT. come around 6:30PM', private: false)
@admin2.events.create!(name: 'Soup Soup Soup!', start_time: '2024-07-28',description:'Soup for days!', private: true)
@admin4.events.create!(name: 'I Love Soup!', start_time: '2024-07-23',description:'I just really love soup.', private: false)
@admin4.events.create!(name: 'Yes, you can have some more!', start_time: '2024-08-03',description:'Come for soup at 4:30PM', private: false)

puts "Events Created!"

## Create Attendees and Invitations

puts "Creating Attendees and Invitations"

Attendee.create!(user_id: 3, event_id: 1, attending: false)
Attendee.create!(user_id: 4, event_id: 1, attending: true)
Attendee.create!(user_id: 3, event_id: 2, attending: true)
Attendee.create!(user_id: 4, event_id: 2, attending: true)
Attendee.create!(user_id: 3, event_id: 6, attending: false)
Attendee.create!(user_id: 4, event_id: 6, attending: false)
Attendee.create!(user_id: 3, event_id: 7, attending: true)
Attendee.create!(user_id: 4, event_id: 7, attending: false)
Attendee.create!(user_id: 1, event_id: 8, attending: false)
Attendee.create!(user_id: 2, event_id: 8, attending: false)
Attendee.create!(user_id: 1, event_id: 9, attending: true)
Attendee.create!(user_id: 2, event_id: 9, attending: true)
Attendee.create!(user_id: 1, event_id: 4, attending: false)
Attendee.create!(user_id: 2, event_id: 4, attending: false)
Attendee.create!(user_id: 1, event_id: 5, attending: false)
Attendee.create!(user_id: 2, event_id: 5, attending: true)

puts "Events now have Attendees and Invitations"

## Create Friendships

puts "Creating Friendships..."

@admin1.friends.create!(friend_id: 2)
@admin1.friends.create!(friend_id: 3, pending: false)
@admin1.friends.create!(friend_id: 4, pending: false)
@admin1.friends.create!(friend_id: 16, pending: false)
@admin1.friends.create!(friend_id: 13)
@admin1.friends.create!(friend_id: 9, pending: false)
@admin1.friends.create!(friend_id: 19, pending: false)
@admin2.friends.create!(friend_id: 3, pending: false)
@admin2.friends.create!(friend_id: 4, pending: false)
@admin2.friends.create!(friend_id: 7, pending: false)
@admin2.friends.create!(friend_id: 8, pending: false)
@admin2.friends.create!(friend_id: 12)
@admin2.friends.create!(friend_id: 20, pending: false)
@admin2.friends.create!(friend_id: 18, pending: false)
@admin2.friends.create!(friend_id: 6, pending: false)
@admin5.friends.create!(friend_id: 1)
@admin5.friends.create!(friend_id: 2)
@admin5.friends.create!(friend_id: 3, pending: false)
@admin5.friends.create!(friend_id: 6, pending: false)
@admin5.friends.create!(friend_id: 9, pending: false)
@admin5.friends.create!(friend_id: 11, pending: false)
@admin5.friends.create!(friend_id: 12)
@admin5.friends.create!(friend_id: 17)
@admin5.friends.create!(friend_id: 19)
@admin5.friends.create!(friend_id: 20, pending: false)
@admin3.friends.create!(friend_id: 4, pending: false)
@admin3.friends.create!(friend_id: 6, pending: false)
@admin3.friends.create!(friend_id: 8, pending: false)
@admin3.friends.create!(friend_id: 13)
@admin3.friends.create!(friend_id: 15, pending: false)
@admin3.friends.create!(friend_id: 16, pending: false)
@admin3.friends.create!(friend_id: 19)
@admin3.friends.create!(friend_id: 20, pending: false)
@admin4.friends.create!(friend_id: 7, pending: false)
@admin4.friends.create!(friend_id: 10, pending: false)
@admin4.friends.create!(friend_id: 11)
@admin4.friends.create!(friend_id: 13, pending: false)
@admin4.friends.create!(friend_id: 15)
@admin4.friends.create!(friend_id: 17, pending: false)
@admin4.friends.create!(friend_id: 20, pending: false)

puts "Some Users are Friends!"

## Create User Inventory Item Data

puts "Giving Users Some Items..."

@admin1.items.create!(name: 'carrots', quantity: 25, expiration_date: '2024-07-10')
@admin1.items.create!(name: 'potatos', quantity: 15, expiration_date: '2024-07-17')
@admin1.items.create!(name: 'onions', quantity: 2, expiration_date: '2024-07-06')
@admin2.items.create!(name: 'penne', quantity: 1, expiration_date: '2024-12-25')
@admin2.items.create!(name: 'tomatos', quantity: 3, expiration_date: '2024-07-03')
@admin2.items.create!(name: 'sausages', quantity: 6, expiration_date: '2024-07-12')

puts "Users have Items!"

## Create Saved Recipes

puts "Giving Users Recipes..."

@recipe1 = @admin1.recipes.create!(directions: nil, name: 'Real tomato soup', image: open_asset('default-soup.jpeg'), description: nil, cooking_time: '25 minutes', source: 'BBC Good Food', recipe_url: 'https://www.bbcgoodfood.com/recipes/real-tomato-soup')
@recipe2 = @admin2.recipes.create!(directions: nil, name: 'Strawberry & Tomato gazpacho', image: open_asset('default-soup.jpeg'), description: 'A refreshing summer soup!', cooking_time: '0 minutes', source: 'Food52', recipe_url: 'https://food52.com/recipes/29986-strawberry-tomato-gazpacho')
@recipe3 = @admin2.recipes.create!(directions: nil, name: 'Creamy Tomato Soup', image: open_asset('default-soup.jpeg'), description: nil, cooking_time: '90 minutes', source: 'Honest Cooking', recipe_url: 'http://honestcooking.com/tomato-soup-and-a-recipe-for-sharing/')
@recipe4 = @admin3.recipes.create!(directions: nil, name: 'Creamy Tomato Soup', image: open_asset('default-soup.jpeg'), description: nil, cooking_time: '0 minutes', source: 'Lottie + Doof', recipe_url: 'http://www.lottieanddoof.com/2008/12/best-tomato-soup/')
@recipe5 = @admin3.recipes.create!(directions: nil, name: 'Fresh tomato broth', image: open_asset('default-soup.jpeg'), description: nil, cooking_time: '110 minutes', source: 'Jamie Oliver', recipe_url: 'http://www.jamieoliver.com/recipes/vegetables-recipes/fresh-tomato-broth/')
@recipe6 = @admin4.recipes.create!(directions: nil, name: 'DIY Instant Tomato Bell Pepper Soup Recipe', image: open_asset('default-soup.jpeg'), description: nil, cooking_time: '2 minutes', source: 'Serious Eats', recipe_url: 'http://www.seriouseats.com/recipes/2013/02/diy-instant-tomato-bell-pepper-soup-recipe.html')

puts "Users have Saved Recipes!"

## Recipes need ingredients

puts "Creating Ingredient Lists for Recipes..."

["2 tbsp olive oil", "1 onion, chopped", "1 garlic clove, finely chopped", "1 tbsp tomato purée", "400g can chopped tomato", "handful basil leaf", "pinch bicarbonate of soda", "600ml milk"].each do |item| @recipe1.ingredients.create!(item: item) end
["250 grams strawberries", "250 grams tomato", "3-4 tablespoons aged balsamic vinegar", "fleur de sel to season", "Bunch of basil leaves"].each do |item| @recipe2.ingredients.create!(item: item) end
["¼ cup of olive oil", "4 or 5 large carrots", "1 medium onion", "10 roma tomatoes", "2 cups tomato sauce*", "2 celery stalks", "2 cups chicken stock", "½ cup heavy cream", "1 teaspoon chipotle powder", "Salt and pepper to taste"].each do |item| @recipe3.ingredients.create!(item: item) end
["56 oz whole tomatoes packed in juice,, drained, 3 cups juice reserved", "1 1/2 tbsp Dark Brown Sugar", "3 tbsp Unsalted Butter", "4 x Shallots large, minced (about 1/2 cup)", "1 tbsp Tomato Paste", "1 pinch ground allspice", "2 tbsp all-purpose flour", "1 3/4 cup Chicken Stock, homemade or canned low-sodium", "1/4 cup Heavy Cream", "Salt and cayenne pepper to taste"].each do |item| @recipe4.ingredients.create!(item: item) end
["4 onions", "6 cloves of garlic", "4 sticks of celery", "20 large mixed-colour tomatoes , (about 2.5kg)", "1 x 2kg whole free-range chicken , fat trimmed off", "1 tablespoon tomato purée , optional"].each do |item| @recipe5.ingredients.create!(item: item) end
["2 tablespoons tomato powder", "1 teaspoon red bell pepper powder", "1/4 teaspoon granulated onion", "Pinch of dried dill, parsley, or basil (optional)", "1 1/4 cups boiling water", "Kosher salt and freshly ground black pepper"].each do |item| @recipe6.ingredients.create!(item: item) end

puts "Recipes have Ingredients!"

## Create Reviews

puts "Write Reviews for Recipes..."

Review.create!(user_id: 3, recipe_id: 1, rating: 5, comment: "This is the best tomato soup I've ever had!")
Review.create!(user_id: 16, recipe_id: 1, rating: 3, comment: "I've had better...")
Review.create!(user_id: 19, recipe_id: 1, rating: 4, comment: "Not bad at all. I think it needs another vegetable though.")
Review.create!(user_id: 3, recipe_id: 2, rating: 2, comment: "Not my favourite...")
Review.create!(user_id: 20, recipe_id: 2, rating: 1, comment: "I don't think strawberries should be anywhere near soup")
Review.create!(user_id: 8, recipe_id: 2, rating: 4, comment: "This is so refreshing on a hot day!")
Review.create!(user_id: 4, recipe_id: 3, rating: 4, comment: "A very good soup for a fall day")
Review.create!(user_id: 8, recipe_id: 3, rating: 5, comment: "So creamy!")
Review.create!(user_id: 7, recipe_id: 3, rating: 5, comment: "My new favorite tomato soup!")
Review.create!(user_id: 18, recipe_id: 3, rating: 4, comment: "My kids love this one.")
Review.create!(user_id: 4, recipe_id: 4, rating: 4, comment: "I made this for my GF")
Review.create!(user_id: 8, recipe_id: 4, rating: 5, comment: "This one is the GOAT")
Review.create!(user_id: 15, recipe_id: 4, rating: 3, comment: "I don't know about this one. I don't think it has enough substance")
Review.create!(user_id: 16, recipe_id: 4, rating: 4, comment: "My kids will eat this!")
Review.create!(user_id: 1, recipe_id: 4, rating: 5, comment: "Good soup")
Review.create!(user_id: 5, recipe_id: 5, rating: 2, comment: "Not a fan.")
Review.create!(user_id: 15, recipe_id: 5, rating: 5, comment: "I really love this one")
Review.create!(user_id: 20, recipe_id: 5, rating: 3, comment: "I found it a bit hard to make.")
Review.create!(user_id: 1, recipe_id: 6, rating: 5, comment: "Easiest soup ever")
Review.create!(user_id: 13, recipe_id: 6, rating: 4, comment: "So simple to make!")

puts "Recipes have Reviews!"

puts "Seeding Complete!"
