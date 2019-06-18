class PurchasesController < ApplicationController
    def create 
        user_id=session[:user_id]
        
        Purchase.create(book_id: params[:book_id], user_id: user_id)

        redirect_to "/users/#{user_id}"
    end
end
