require 'rails_helper'

RSpec.describe "usersbests#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/usersbests/#{usersbest.id}", params: params
  end

  describe 'basic fetch' do
    let!(:usersbest) { create(:usersbest) }

    it 'works' do
      expect(UsersbestResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('usersbests')
      expect(d.id).to eq(usersbest.id)
    end
  end
end
