require 'rails_helper'

RSpec.describe "Studies", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/study/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /question" do
    it "returns http success" do
      get "/study/question"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /next_question" do
    it "returns http success" do
      get "/study/next_question"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /previous_question" do
    it "returns http success" do
      get "/study/previous_question"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /end" do
    it "returns http success" do
      get "/study/end"
      expect(response).to have_http_status(:success)
    end
  end

end
