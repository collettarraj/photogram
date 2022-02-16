require "rails_helper"

RSpec.describe "usersbests#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/usersbests", params: params
  end

  describe "basic fetch" do
    let!(:usersbest1) { create(:usersbest) }
    let!(:usersbest2) { create(:usersbest) }

    it "works" do
      expect(UsersbestResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["usersbests"])
      expect(d.map(&:id)).to match_array([usersbest1.id, usersbest2.id])
    end
  end
end
