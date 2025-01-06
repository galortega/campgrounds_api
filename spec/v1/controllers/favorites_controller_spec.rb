require 'rails_helper'

RSpec.describe V1::FavoritesController, type: :controller do
  fixtures :favorites, :users, :campgrounds


  before do
    session = users(:two).sessions.create!(user_agent: "RSpec Test", ip_address: "127.0.0.1")
    request.headers["Authorization"] = "Bearer #{session.token}"
  end

  describe "POST #create" do
    it "creates a favorite" do
      expect {
        post :create, params: { favorite: { campground_id: campgrounds(:two).id } }, format: :json
      }.to change(Favorite, :count).by(1)
    end
  end

  describe "DELETE #destroy" do
    it "removes a favorite" do
      favorite = favorites(:one)
      expect {
        delete :destroy, params: { id: favorite.id }, format: :json
      }.to change(Favorite, :count).by(-1)
    end
  end
end
