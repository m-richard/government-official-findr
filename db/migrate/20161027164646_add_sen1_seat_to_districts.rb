class AddSen1SeatToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :sen1_seat, :string
  end
end
