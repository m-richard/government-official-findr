class AddSen2SeatToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :sen2_seat, :string
  end
end
