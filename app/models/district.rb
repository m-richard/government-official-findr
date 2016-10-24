class District < ActiveRecord::Base
  has_many :addresses

  validates :name, presence: true
  validates :representative, presence: true
end
