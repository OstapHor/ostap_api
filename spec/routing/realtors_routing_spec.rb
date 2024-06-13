require "rails_helper"

RSpec.describe RealtorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/realtors").to route_to("realtors#index")
    end

    it "routes to #show" do
      expect(get: "/realtors/1").to route_to("realtors#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/realtors").to route_to("realtors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/realtors/1").to route_to("realtors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/realtors/1").to route_to("realtors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/realtors/1").to route_to("realtors#destroy", id: "1")
    end
  end
end
