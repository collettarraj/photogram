class DishResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :dishname, :string
  attribute :cuisine_id, :integer

  # Direct associations

  has_many   :usersbests,
             foreign_key: :dishes_id

  belongs_to :cuisine

  # Indirect associations

  many_to_many :venues

end
