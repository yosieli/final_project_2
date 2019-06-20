class User < ApplicationRecord
   
    has_many :purchases
    has_many :books, through: :purchases
    has_one_attached :avatar 
    has_secure_password
    validates :user_name, uniqueness:{case_sensitive:false}

    
    def before_save
        self.user_name.capitalize!
    end
        
    def add_book(book_id)
        item = items.where('book_id = ?', book_id).first
    if item
        # increase the quantity of product in cart
        item.quantity + 1
        save
    else
        # product does not exist in cart
        book= Book.find(book_id)
        items << book
    end

    
    
end
    
end
