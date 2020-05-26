require "rails_helper"

RSpec.describe Api::V1::TweetsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/api/v1/tweets").to route_to("api/v1/tweets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/tweets/1").to route_to("api/v1/tweets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/tweets/1").to route_to("api/v1/tweets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/tweets/1").to route_to("api/v1/tweets#destroy", id: "1")
    end
  end
end
