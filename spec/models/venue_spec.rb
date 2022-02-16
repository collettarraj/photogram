require 'rails_helper'

RSpec.describe Venue, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:usersbests) }

    end

    describe "InDirect Associations" do

    it { should have_many(:dishes) }

    end

    describe "Validations" do

    end
end
