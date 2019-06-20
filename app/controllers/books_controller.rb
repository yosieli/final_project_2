class BooksController < ApplicationController
  # helper_method :api_image_search
  
  def create
      book = Book.create(strong_params)
      user_id = session[:user_id]
      Purchase.create(user_id: user_id, book_id: book.id)
      redirect_to "/users/#{user_id}"
  end


  def index
      @books = Book.all
      id=session[:user_id]
      @user= User.find(id)
  end
  def show
    @book = Book.find(params[:id])
  end

  def search
      @search = @@search_result
  end

  def search_form
    if strong_params[:book_list] == 'author'
       @@search_result = api_search("author:#{strong_params[:search]}")
       redirect_to "/books/search"
    elsif strong_params[:book_list] == 'title'
      @@search_result = api_search(strong_params[:search])
      redirect_to "/books/search"
    end
  end

  def api_search(input)
    response = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=#{input}&maxResults=3&printType=books")
    api_response = JSON.parse(response)
    api_response
  end

  def api_image_search
    img_url = nil
    @@search_result['items'].each do |book|
      self_link = RestClient.get(book['selfLink'])
      item_info = JSON.parse(self_link)
      img_url = item_info['volumeInfo']['imageLinks']['small']  
    end
      img_url
  end

  def strong_params
     
    params.require(:book).permit([:title, :genre, :img_url, :author, :book_list, :search, :summary, :page_count])

  end


end
