require 'rails_helper'

RSpec.describe "IncorrectChoices", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/incorrect_choices/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/incorrect_choices/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/incorrect_choices/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/incorrect_choices/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/incorrect_choices/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
