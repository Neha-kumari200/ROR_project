class Comment < ApplicationRecord	
  belongs_to :account
  belongs_to :post
  has_one_attached :image 
  has_many :replies, class_name: "Comment", foreign_key: :post_id, dependent: :destroy
end
