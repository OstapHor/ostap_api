require 'rails_helper'

RSpec.describe "/ratings", type: :request do
 
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Rating.create! valid_attributes
      get ratings_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      rating = Rating.create! valid_attributes
      get rating_url(rating), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Rating" do
        expect {
          post ratings_url,
               params: { rating: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Rating, :count).by(1)
      end

      it "renders a JSON response with the new rating" do
        post ratings_url,
             params: { rating: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Rating" do
        expect {
          post ratings_url,
               params: { rating: invalid_attributes }, as: :json
        }.to change(Rating, :count).by(0)
      end

      it "renders a JSON response with errors for the new rating" do
        post ratings_url,
             params: { rating: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested rating" do
        rating = Rating.create! valid_attributes
        patch rating_url(rating),
              params: { rating: new_attributes }, headers: valid_headers, as: :json
        rating.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the rating" do
        rating = Rating.create! valid_attributes
        patch rating_url(rating),
              params: { rating: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the rating" do
        rating = Rating.create! valid_attributes
        patch rating_url(rating),
              params: { rating: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested rating" do
      rating = Rating.create! valid_attributes
      expect {
        delete rating_url(rating), headers: valid_headers, as: :json
      }.to change(Rating, :count).by(-1)
    end
  end
end
