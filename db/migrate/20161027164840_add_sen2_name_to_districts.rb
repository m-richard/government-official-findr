class AddSen2NameToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :sen2_name, :string
  end
end
