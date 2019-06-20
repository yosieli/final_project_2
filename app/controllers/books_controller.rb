class BooksController < ApplicationController
    def index
      @books = Book.all
      id=session[:user_id]
      @user= User.find(id)
      @book_response = api_search
    end

    def new
      @book=Book.new()
    end

    def show
        @book=Book.find(params[:id])
    end

    def add
      @book = Book.create(strong_params)
      
      redirect_to "/books"

    end
    
    def api_search
      response = RestClient.get('https://www.googleapis.com/books/v1/volumes?q=?&maxResults=3&printType=books')
      api_response = JSON.parse(response)
      api_response
    end

    def search
    
    end
  



    def strong_params
     
      params.require(:book).permit([:title, :genre,:img_url,:autor_id])

    end


end
