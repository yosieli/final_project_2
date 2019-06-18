class BooksController < ApplicationController
    def index
    @books = Book.all
    id=session[:user_id]
    @user= User.find(id)


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



    def strong_params
     
      params.require(:book).permit([:title, :genre,:img_url,:autor_id])

    end


end
