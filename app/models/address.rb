class Address < ActiveRecord::Base
  belongs_to :district

  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, length: { is: 5 }, numericality: true
end
