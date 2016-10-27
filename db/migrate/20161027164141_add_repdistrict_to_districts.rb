class AddRepdistrictToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :rep_district, :string
  end
end
