require "rails_helper"

RSpec.describe JoinGamesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/join_games").to route_to("join_games#index")
    end

    it "routes to #new" do
      expect(get: "/join_games/new").to route_to("join_games#new")
    end

    it "routes to #show" do
      expect(get: "/join_games/1").to route_to("join_games#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/join_games/1/edit").to route_to("join_games#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/join_games").to route_to("join_games#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/join_games/1").to route_to("join_games#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/join_games/1").to route_to("join_games#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/join_games/1").to route_to("join_games#destroy", id: "1")
    end
  end
end
