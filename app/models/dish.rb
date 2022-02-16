class Dish < ApplicationRecord
  # Direct associations

  belongs_to :cuisine

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    dishname
  end

end
