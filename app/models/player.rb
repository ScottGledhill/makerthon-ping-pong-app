class Player < ActiveRecord::Base
  has many :games
  validates :name, length: {minimum: 3}
end
