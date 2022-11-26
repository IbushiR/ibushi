class Tweet < ApplicationRecord
  has_many :comments
  has_many :favorites, as: :favoriteable
  belongs_to :user
end
