class Dish < ApplicationRecord
  # Direct associations

  has_many   :usersbests,
             :foreign_key => "dishes_id",
             :dependent => :destroy

  belongs_to :cuisine

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    dishname
  end

end
