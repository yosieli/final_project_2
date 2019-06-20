
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





#  5.times do
#    Autor.create(name: Faker::Name.name, bio: 'Random placeholder')

# end

def api_search
   response = RestClient.get('https://www.googleapis.com/books/v1/volumes?q=subject:fiction&maxResults=20&printType=books')
   api_response = JSON.parse(response)
   
   api_response['items'].each do |book|
      self_link = RestClient.get(book['selfLink'])
      item_info = JSON.parse(self_link)
      title = book['volumeInfo']['title']
      genre = book['volumeInfo']['categories'][0]
      img_url = item_info['volumeInfo']['imageLinks']['small']
      author = book['volumeInfo']['authors'][0]
      page_count = book['volumeInfo']['pageCount']
      summary = book['volumeInfo']['description']
      
      Book.create(title: title, genre: genre, img_url: img_url, author: author, page_count: page_count, summary: summary)
     
   end
end
# api_search
 

    



  5.times do
     User.create(user_name: Faker::Name.first_name,password: "1234"  )

 end
 
#  5.times do
#     Purchase.create(user_id: rand(1..5),book_id: rand(1..5) )

# end













 

