class Campground < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user

  attr_accessor :is_favorited

  # Scope to search for campgrounds by name, location, or description
  scope :search, ->(pattern) {
    if pattern.blank?
      all
    else
      where("name ILIKE ? OR location ILIKE ? OR description ILIKE ?", "%#{pattern}%", "%#{pattern}%", "%#{pattern}%")
    end
  }

  # Class method to mark campgrounds as favorited by the user
  def self.mark_favorited(campgrounds, user)
    Array(campgrounds).each do |campground|
      campground.is_favorited = campground.favorited_by?(user)
    end
  end

  # Instance method to check if the campground is favorited by the user
  def favorited_by?(user)
    favorites.exists?(user: user)
  end
end
