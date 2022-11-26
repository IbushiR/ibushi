class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_many :favorites, as: :favoriteable
end
