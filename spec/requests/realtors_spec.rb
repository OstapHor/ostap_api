require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/realtors", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Realtor. As you add validations to Realtor, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # RealtorsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Realtor.create! valid_attributes
      get realtors_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      realtor = Realtor.create! valid_attributes
      get realtor_url(realtor), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Realtor" do
        expect {
          post realtors_url,
               params: { realtor: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Realtor, :count).by(1)
      end

      it "renders a JSON response with the new realtor" do
        post realtors_url,
             params: { realtor: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Realtor" do
        expect {
          post realtors_url,
               params: { realtor: invalid_attributes }, as: :json
        }.to change(Realtor, :count).by(0)
      end

      it "renders a JSON response with errors for the new realtor" do
        post realtors_url,
             params: { realtor: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested realtor" do
        realtor = Realtor.create! valid_attributes
        patch realtor_url(realtor),
              params: { realtor: new_attributes }, headers: valid_headers, as: :json
        realtor.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the realtor" do
        realtor = Realtor.create! valid_attributes
        patch realtor_url(realtor),
              params: { realtor: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the realtor" do
        realtor = Realtor.create! valid_attributes
        patch realtor_url(realtor),
              params: { realtor: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested realtor" do
      realtor = Realtor.create! valid_attributes
      expect {
        delete realtor_url(realtor), headers: valid_headers, as: :json
      }.to change(Realtor, :count).by(-1)
    end
  end
end