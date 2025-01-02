class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :campground

  validates :user_id, uniqueness: { scope: :campground_id, message: "has already favorited this campground" }
end
