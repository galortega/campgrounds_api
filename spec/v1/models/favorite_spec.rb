require 'rails_helper'

RSpec.describe Favorite, type: :model do
  fixtures :users, :campgrounds, :favorites

  describe "validations" do
    it "validates uniqueness of user_id scoped to campground_id" do
      duplicate_favorite = Favorite.new(user: users(:one), campground: campgrounds(:one))
      expect(duplicate_favorite.valid?).to eq(false)
      expect(duplicate_favorite.errors[:user_id]).to include("has already favorited this campground")
    end
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:campground) }
  end
end
