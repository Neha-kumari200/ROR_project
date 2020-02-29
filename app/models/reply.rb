class Reply < ApplicationRecord
  belongs_to :comment
  belongs_to :post
  has_one_attached :image 
end
