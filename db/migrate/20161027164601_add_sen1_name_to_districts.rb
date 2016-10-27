class AddSen1NameToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :sen1_name, :string
  end
end
