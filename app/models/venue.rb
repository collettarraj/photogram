class Venue < ApplicationRecord
  # Direct associations

  has_many   :usersbests,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    venuename
  end

end
