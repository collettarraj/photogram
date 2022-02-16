require "rails_helper"

RSpec.describe UsersbestResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "usersbests",
          attributes: {},
        },
      }
    end

    let(:instance) do
      UsersbestResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Usersbest.count }.by(1)
    end
  end

  describe "updating" do
    let!(:usersbest) { create(:usersbest) }

    let(:payload) do
      {
        data: {
          id: usersbest.id.to_s,
          type: "usersbests",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      UsersbestResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { usersbest.reload.updated_at }
      # .and change { usersbest.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:usersbest) { create(:usersbest) }

    let(:instance) do
      UsersbestResource.find(id: usersbest.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Usersbest.count }.by(-1)
    end
  end
end
