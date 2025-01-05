class Campground < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user

  attr_accessor :is_favorited

  def self.search(pattern)
    if pattern.blank?
      all
    else
      where("name ILIKE ? OR location ILIKE ? OR description ILIKE ?", "%#{pattern}%", "%#{pattern}%", "%#{pattern}%")
    end
  end

  def self.mark_favorited(campgrounds, user)
    Array(campgrounds).each do |campground|
      campground.is_favorited = campground.favorited_by?(user)
    end
  end

  def favorited_by?(user)
    favorites.exists?(user: user)
  end
end
