class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user, foreign_key: 'user_id'
    has_many :replies, foreign_key: 'comment_ids', class_name: 'Comment'
end
