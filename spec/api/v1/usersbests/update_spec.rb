require 'rails_helper'

RSpec.describe "usersbests#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/usersbests/#{usersbest.id}", payload
  end

  describe 'basic update' do
    let!(:usersbest) { create(:usersbest) }

    let(:payload) do
      {
        data: {
          id: usersbest.id.to_s,
          type: 'usersbests',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(UsersbestResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { usersbest.reload.attributes }
    end
  end
end
