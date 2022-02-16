class Cuisine < ApplicationRecord
  # Direct associations

  has_many   :dishes,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    cuisine_name
  end

end
