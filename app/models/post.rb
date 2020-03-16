class Post < ApplicationRecord
  belongs_to :account	
  has_one_attached :image 
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :description, :length => { :in => 10..255 } 
  validates :title, presence: true, length: { minimum: 5 }
  #mount_uploader :comments	

  def find_comment_for_account(account)
    account.comments.find_by(post_id: self.id)
  end
end
