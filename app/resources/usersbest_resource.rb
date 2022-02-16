class UsersbestResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :dishes_id, :integer
  attribute :venue_id, :integer
  attribute :users_id, :integer

  # Direct associations

  belongs_to :venue

  belongs_to :dishes,
             resource: DishResource

  belongs_to :users,
             resource: UserResource

  # Indirect associations
end
