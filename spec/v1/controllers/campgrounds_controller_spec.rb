require 'rails_helper'

RSpec.describe V1::CampgroundsController, type: :controller do
  render_views # This line is important to render the views in the response

  fixtures :campgrounds, :users, :favorites

  describe "GET #index" do
    it "returns a list of campgrounds" do
      get :index, params: {}, format: :json
      expect(response).to have_http_status(:ok)
      expect(response.body).not_to be_empty
    end
  end

  describe "GET #show" do
    it "returns a specific campground" do
      get :show, params: { id: campgrounds(:one).id }, format: :json
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["name"]).to eq(campgrounds(:one).name)
    end
  end
end
