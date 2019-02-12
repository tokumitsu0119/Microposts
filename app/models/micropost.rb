class Micropost < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :likes
  has_many :iine_users, through: :likes, source: :user
 
  def iine(user)
    likes.create(user_id: user.id)
  end

  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end
  
  def iine?(user)
    iine_users.include?(user)
  end
  
end