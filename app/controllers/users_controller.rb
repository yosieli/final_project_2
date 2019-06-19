class UsersController < ApplicationController
    def index
        @users= User.all
        @book=Book.all
    end

    def show
        @user = User.find(params[:id])
       # @book=@user.books
        
    end


    def new 
       @user=User.new 
       
    end

    def display_login_form

    end

    def create
        
        @user=User.create(strong_params)
        
        redirect_to "/login"
    end

    def edit
        @user =User.find(params[:id])
    end

    def update
     @user = User.find(params[:id])
     @user.update(strong_params)
     
     redirect_to "/users/#{@user.id}"  
    end

    def authenticate
        # The username the use wrote to find the user 
        user= User.find_by(user_name: params[:user_name])
    
        
        # Then check if the password they wrote was correct
    
        if user != nil && user.authenticate(params[:password] )
             # If it was, save the users id in the session
            session[:user_id] = user.id
            redirect_to "/users/#{user.id}"
        else 
            # oops
        end
    end



    def destroy      
        session[:user_id] = nil     
        redirect_to '/login' 
    end
    
    # def add_book
    #     current_book.add_book(params[:book_id])
    #     # redirect to shopping cart or whereever
    #   end
    


    def strong_params

    
        params.require(:user).permit([:user_name, :password])
    end



    # kfjlkfjkfj

    

     
     

end
