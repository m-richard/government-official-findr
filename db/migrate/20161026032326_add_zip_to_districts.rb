class AddZipToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :zip_code, :string, null: false
  end
end
