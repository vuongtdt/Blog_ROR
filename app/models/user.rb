class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :posts
    # has_many :comments
    # has_many :follows, foreign_key: 'following_used_id', class_name: 'Follow'
    # has_many :following_users, through: :follows, source: :following_user
    # has_many :follows, foreign_key: 'followed_used_id', class_name: 'Follow'
    # has_many :followed_users, through: :follows, source: :followed_user

    # def if_true?
    #     posts.each do |post|
    #         method_x(post)
    #     end
        
    #     username

    #     method_y
    # end

    # def method_x(post)
    # end
end
