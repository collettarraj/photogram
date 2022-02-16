require 'rails_helper'

RSpec.describe UsersbestResource, type: :resource do
  describe 'serialization' do
    let!(:usersbest) { create(:usersbest) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(usersbest.id)
      expect(data.jsonapi_type).to eq('usersbests')
    end
  end

  describe 'filtering' do
    let!(:usersbest1) { create(:usersbest) }
    let!(:usersbest2) { create(:usersbest) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: usersbest2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([usersbest2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:usersbest1) { create(:usersbest) }
      let!(:usersbest2) { create(:usersbest) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            usersbest1.id,
            usersbest2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            usersbest2.id,
            usersbest1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
