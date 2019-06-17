class UsersController < ApplicationController
    def index
        @users= User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new 
        
    end

    def display_login_form

    end

    def create
<<<<<<< HEAD
        @user=User.create(strong_params[:user])
        redirect_to "/users/show"
=======
        @user=User.create(strong_params)
        redirect_to "/users/#{@user.id}"
>>>>>>> master
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

    
<<<<<<< HEAD
    #     params.permit([:user_name, :password])
        def strong_params
            params.permit(
                user: [
                    :user_name,
                    :password_digest
                    
                ]
            )
        end

=======
        params.require(:user).permit([:user_name, :password])
    end
>>>>>>> master

    

     
     

end
