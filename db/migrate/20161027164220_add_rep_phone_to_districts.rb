class AddRepPhoneToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :rep_phone, :string
  end
end
