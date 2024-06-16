require 'rails_helper'

RSpec.describe "/contracts", type: :request do
 
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
      Contract.create! valid_attributes
      get contracts_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      contract = Contract.create! valid_attributes
      get contract_url(contract), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Contract" do
        expect {
          post contracts_url,
               params: { contract: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Contract, :count).by(1)
      end

      it "renders a JSON response with the new contract" do
        post contracts_url,
             params: { contract: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Contract" do
        expect {
          post contracts_url,
               params: { contract: invalid_attributes }, as: :json
        }.to change(Contract, :count).by(0)
      end

      it "renders a JSON response with errors for the new contract" do
        post contracts_url,
             params: { contract: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested contract" do
        contract = Contract.create! valid_attributes
        patch contract_url(contract),
              params: { contract: new_attributes }, headers: valid_headers, as: :json
        contract.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the contract" do
        contract = Contract.create! valid_attributes
        patch contract_url(contract),
              params: { contract: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the contract" do
        contract = Contract.create! valid_attributes
        patch contract_url(contract),
              params: { contract: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested contract" do
      contract = Contract.create! valid_attributes
      expect {
        delete contract_url(contract), headers: valid_headers, as: :json
      }.to change(Contract, :count).by(-1)
    end
  end
end
