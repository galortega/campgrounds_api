class Campground < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user
end
