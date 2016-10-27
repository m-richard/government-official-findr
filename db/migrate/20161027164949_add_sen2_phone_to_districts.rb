class AddSen2PhoneToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :sen2_phone, :string
  end
end
