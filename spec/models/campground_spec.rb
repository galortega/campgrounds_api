require 'rails_helper'

RSpec.describe Campground, type: :model do
  fixtures :campgrounds, :users, :favorites

  describe "associations" do
    it { should have_many(:favorites).dependent(:destroy) }
    it { should have_many(:favorited_by_users).through(:favorites).source(:user) }
  end

  # describe ".search" do
  #   it "returns campgrounds matching the search pattern" do
  #     results = Campground.search("Sequoia")
  #     expect(results.pluck(:name)).to include("Sequoia RV Park")
  #   end

  #   it "returns all campgrounds when the pattern is blank" do
  #     results = Campground.search("")
  #     expect(results.count).to eq(Campground.count)
  #   end
  # end

  # describe "#favorited_by?" do
  #   it "returns true if the campground is favorited by the user" do
  #     user = users(:one)
  #     campground = campgrounds(:one)
  #     expect(campground.favorited_by?(user)).to eq(true)
  #   end

  #   it "returns false if the campground is not favorited by the user" do
  #     user = users(:two)
  #     campground = campgrounds(:three)
  #     expect(campground.favorited_by?(user)).to eq(false)
  #   end
  # end
end
