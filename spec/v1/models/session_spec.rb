require 'rails_helper'

RSpec.describe Session, type: :model do
  fixtures :users

  describe "before_create callback" do
    it "generates a token before creation" do
      user = users(:one)
      session = user.sessions.create(ip_address: "127.0.0.1", user_agent: "RSpec Test")
      expect(session.token).not_to be_nil
    end
  end

  describe "#regenerate_token!" do
    it "regenerates the token and saves the session" do
      user = users(:one)
      session = user.sessions.create(ip_address: "127.0.0.1", user_agent: "RSpec Test")
      old_token = session.token
      session.regenerate_token!
      expect(session.token).not_to eq(old_token)
    end
  end
end
