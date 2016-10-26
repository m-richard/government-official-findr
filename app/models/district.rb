class District < ActiveRecord::Base
  has_many :addresses

  validates :zip_code, presence: true, length: { is: 5 }, numericality: true
end
