class Tweet < ApplicationRecord
  has_many :comments
  has_many :favorites, as: :favoriteable
  belongs_to :user
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
  def self.search(keyword)
    where(["content like? OR id like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
