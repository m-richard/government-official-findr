class AddSen1PhoneToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :sen1_phone, :string
  end
end
