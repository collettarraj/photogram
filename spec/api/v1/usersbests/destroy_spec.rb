require "rails_helper"

RSpec.describe "usersbests#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/usersbests/#{usersbest.id}"
  end

  describe "basic destroy" do
    let!(:usersbest) { create(:usersbest) }

    it "updates the resource" do
      expect(UsersbestResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Usersbest.count }.by(-1)
      expect { usersbest.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
