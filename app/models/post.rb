class Post < ApplicationRecord
    belongs_to :user
    has_many :comments

    # def method_a
        
    # end

    # def self.method_b
    # end

    # private

    # def method_c
    # end
end
