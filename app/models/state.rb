class State < ActiveRecord::Base
  has_many :addresses
  
  attr_accessor :rep, :sen1, :sen2

  validates :zip_code, presence: true, length: { is: 5 }, numericality: true
end
