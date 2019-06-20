class BooksController < ApplicationController
    def index
      @books = Book.all
      id=session[:user_id]
      @user= User.find(id)
      @book_response = api_search
    end

    def search

    end

    def search_form
      
      if strong_params[:book_list] == 'author'
        @search_result = api_search("author:#{strong_params[:search]}")
       byebug
      elsif strong_params[:book_list] == 'title'
        @search_result = api_search(strong_params[:search])
        byebug
      end
    end

    def api_search(input)
      response = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=#{input}&maxResults=3&printType=books")
      api_response = JSON.parse(response)
      api_response
    end

    def search
    
    end
  



    def strong_params
     
      params.require(:book).permit([:title, :genre,:img_url, :author, :book_list, :search])

    end


end



  # def new
    #   @book=Book.new()
    #   end
    #   def show
    #     @book=Book.find(params[:id])
    # end

    # def add
    #   @book = Book.create(strong_params)
    #   redirect_to "/books"
    # end