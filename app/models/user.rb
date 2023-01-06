class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  has_many :tweets
  has_many :favorites
  has_many :comments
  has_many :relationships, class_name: "Relationship", foreign_key: "user_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [130, 130]
  end

  def follow(user_id)
    relationships.create(follow_id: user_id)
  end
 
  def unfollow(user_id)
    relationships.find_by(follow_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

end
