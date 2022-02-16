class CuisineResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :cuisine_name, :string

  # Direct associations

  # Indirect associations

end
