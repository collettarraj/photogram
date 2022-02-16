class Venue < ApplicationRecord
  # Direct associations

  has_many   :usersbests,
             :dependent => :destroy

  # Indirect associations

  has_many   :dishes,
             :through => :usersbests,
             :source => :dishes

  # Validations

  # Scopes

  def to_s
    venuename
  end

end
