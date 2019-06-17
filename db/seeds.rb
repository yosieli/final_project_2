# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





 5.times do
   Autor.create(name: Faker::Name.name, bio: 'Random placeholder')

end

5.times do
    Book.create(title: Faker::Book.title,genre: Faker::Book.genre , img_url: Faker::LoremPixel.image,autor_id: rand(1..5))

end

 5.times do
    User.create(user_name: Faker::Name.first_name,password: "1234"  )

 end
 
 5.times do
    Purchase.create(user_id: rand(1..5),book_id: rand(1..5) )

end













 

