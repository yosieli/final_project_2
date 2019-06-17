class Book < ApplicationRecord
    has_many :purchases
    has_many :users, through: :purchases
    belongs_to :autor
end
