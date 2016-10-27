class District < ActiveRecord::Base
  has_many :addresses
  attr_accessor :rep, :sen1, :sen2

  validates :zip_code, presence: true, length: { is: 5 }, numericality: true

  def self.save_data_from_api
    response = Net::HTTP.get_response(URI("http://whoismyrepresentative.com/getall_mems.php?zip=#{zip_code}&output=json"))
    result = JSON.parse(response)
    data = result.map do |line|
      d = District.new
      d.save
    end
    data.select(&:persisted?)
  end
end
