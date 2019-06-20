class UsersController < ApplicationController
    def index
        @users= User.all
        @book=Book.all
    end

    def show
        @user = User.find(params[:id])
       
        
    end

    def display_login_form
        if flash[:error]
            @error = flash[:error]
        end 
    end
    
    def new 
        if flash[:error]
            @error = flash[:error]
        else
            @error = {"user_name" => []}
        end
    end

    def create
        user = User.new(strong_params)
        if user.valid?
            user.before_save
            user.save
            redirect_to  "/login"
        else
            flash[:error] = user.errors.messages
            redirect_to "/users/new"
        end
    end

    def edit
        @user =User.find(params[:id])
    end

    def update
     @user = User.find(params[:id])
     @user.create(strong_params)
     redirect_to "/users/#{@user.id}"  
    end

    def authenticate
        user = User.find_by(user_name: params[:user_name].capitalize)           # The username the use wrote to find the user
        if user != nil && user.authenticate(params[:password] )                 # Then check if the password they wrote was correct
             # If it was, save the users id in the session
            session[:user_id] = user.id
            redirect_to "/users/#{user.id}"
        else 
            flash[:error] = "Username/Password not found"                       #assigns 'error message' to flash cookie
            redirect_to "/login"
        end
    end



    def destroy
              
        session[:user_id] = nil     
        redirect_to '/login' 
    end

    

    def strong_params

    
        params.require(:user).permit([:user_name, :password])
    end


end
