class User < ApplicationRecord
    # has_secure_password
    has_many :purchases
    has_many :books, through: :purchases
    has_secure_password
    
end
