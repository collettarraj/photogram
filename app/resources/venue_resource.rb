class VenueResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :venuename, :string
  attribute :address, :string
  attribute :neighborhood, :string

  # Direct associations

  has_many   :usersbests

  # Indirect associations

  many_to_many :dishes

end
