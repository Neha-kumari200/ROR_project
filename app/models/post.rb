class Post < ApplicationRecord
  belongs_to :account	
  has_one_attached :image 
  has_many :comments
  validates :title, presence: true, length: { minimum: 5 }
  #mount_uploader :comments	
end
