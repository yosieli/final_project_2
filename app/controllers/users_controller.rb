class UsersController < ApplicationController
    def index
        @users= User.all
    end

    def new 
        
    end

    def display_login_form

    end

    def create
        @user=User.create(strong_params[:user])
        redirect_to "/users/show"
    end

    def authenticate
        # The username the use wrote to find the user 
        user= User.find_by(user_name: strong_params[:user_name])
        
        # Then check if the password they wrote was correct
        
        if user != nil && user.authenticate( params[:password] )
             # If it was, save the users id in the session
            session[:user_id] = user.id
            redirect_to "/users/#{user.id}"
        else 
            # oops
        end
    end
    # def strong_params

    
    #     params.permit([:user_name, :password])
        def strong_params
            params.permit(
                user: [
                    :user_name,
                    :password_digest
                    
                ]
            )
        end


    

     
     

end
